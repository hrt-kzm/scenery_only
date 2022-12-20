class Public::PicturesController < ApplicationController
  before_action :ensure_correct_picture, only: [:edit, :update]

  def new
    @picture = Picture.new
  end

  def create
    @picture = Picture.new(picture_params)
    @picture.user_id = current_user.id
    if @picture.save
      redirect_to public_picture_path(@picture), notice: "投稿できました。"
    else
      redirect_to '/top'
    end
  end

  def index
    @pictures = Picture.all
  end

  def show
    @picture = Picture.find(params[:id])
    @user = @picture.user
  end

  def edit
    @picture = Picture.find(params[:id])
  end

  def destroy
    @picture = Picture.find(params[:id])
    @picture.delete
    redirect_to public_pictures_path
  end

  def update
    @picture = Picture.find(params[:id])
    if @picture.update(picture_params)
      redirect_to public_picture_path(@picture), notice: "変更内容を保存しました。"
    else
      render "edit"
    end
  end

  private

  def picture_params
    params.require(:picture).permit(:title, :location, :produce, :scene_image)
  end

  def ensure_correct_picture
    @picture = Picture.find(params[:id])
    @user = @picture.user
    unless @user == current_user
      redirect_to pictures_path
    end
  end

end
