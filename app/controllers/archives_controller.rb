class ArchivesController < ApplicationController
    def new
      @archive = Archive.new
    end
  
    def create
      @archive = Archive.new(archive_params)
      @archive.image.cache! if @archive.image.present? # 👈 加工を確実にする
      
      if @archive.save
        redirect_to @archive
      else
        render :new
      end
    end
  
    def show
      @archive = Archive.find(params[:id])
    end
  
    private
  
    def archive_params
      params.require(:archive).permit(:image, :caption)
    end
  end
