class ProcessedImageUploader < CarrierWave::Uploader::Base
  include CarrierWave::MiniMagick

  # 保存先のディレクトリ指定
  def store_dir
    "uploads/#{model.class.to_s.underscore}/#{mounted_as}/#{model.id}"
  end

  # アップロード時の加工処理
  process :resize_and_add_caption

  def resize_and_add_caption
    manipulate! do |img|
      img.auto_orient

      target_width = 800
      target_height = (target_width / 2.35).to_i
      caption_band_height = 50
      final_height = target_height + caption_band_height * 2

      # 1. アスペクト比 2.35:1 にトリミング（横幅800固定）
      img.combine_options do |c|
        c.resize "#{target_width}x#{target_height}^"
        c.gravity 'center'
        c.crop "#{target_width}x#{target_height}+0+0"
      end

      # 2. 黒幕を上下に付与（上下それぞれ50固定）
      img.combine_options do |c|
        c.gravity 'center'
        c.background 'black'
        c.extent "#{target_width}x#{final_height}"
      end

      # 3. キャプションが入力されている場合にキャプションを付与
      if model.caption.present?
        # フォントファイルのパスを明示的に指定
        font_path = Rails.root.join("app/assets/fonts/NotoSansJP-Light.ttf")
        quoted_caption = "“#{model.caption}”".gsub("'", "\\\\'")

        img.combine_options do |c|
          c.gravity 'south'
          c.fill 'white'
          c.pointsize 24
          c.font font_path.to_s  # ← ここで .ttf ファイルを明示指定
          c.draw "text 0,20 '#{quoted_caption}'"
        end
      end

      img.write(current_path)
      img
    end
  end
end
