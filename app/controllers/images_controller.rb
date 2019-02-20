class ImagesController < ApplicationController
  before_action :set_image, only: [:show, :edit, :update, :destroy]

  def index
    @images = Image.where(user_id: current_user.id)
  end

  def show
    @image
  end

  def new
    @image = Image.new
  end

  def edit
    @image
  end

  def create
    @image = current_user.images.new(image_params)

    if @image.save
      redirect_to images_path
    else
      render 'new'
    end
  end

  def update
    if @image.update(image_params)
      redirect_to @image
    else
      render 'edit'
    end
  end

  def destroy
    @image.destroy
    redirect_to images_path
  end

  private
    def image_params
      params.require(:image).permit(:description, :picture)
    end

    def set_image
      @image = Image.find(params[:id])
    end
end
