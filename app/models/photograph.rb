class Photograph < ApplicationRecord
    mount_uploader :image, ProcessedImageUploader
  # （バリデーションなどは必要に応じてここに追加）
end
