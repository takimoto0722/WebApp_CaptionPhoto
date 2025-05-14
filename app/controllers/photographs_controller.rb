class PhotographsController < ApplicationController
  def new
    @photograph = Photograph.new
  end

  def create
    @photograph = Photograph.new(photograph_params)
    @photograph.image.cache! if @photograph.image.present?  # 加工を確実にする

    if @photograph.save
      redirect_to @photograph
    else
      render :new, status: :unprocessable_entity
    end
  end

  def show
    @photograph = Photograph.find(params[:id])
  end

  private

  def photograph_params
    params.require(:photograph).permit(:image, :caption)
  end
end
