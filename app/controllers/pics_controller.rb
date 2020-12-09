class PicsController < ApplicationController
  before_action :find_pic, only: [:show, :edit, :update, :destroy, :upvote]
  def index
    @pics = Pic.all.order("created_at DESC")
  end

  def new
    @pic = Pic.new
    @pic.user_id = current_user
  end

  def create
    @pic = Pic.new(pic_params)
    @pic.user = current_user
    if @pic.save
      redirect_to pic_path(@pic)
    else
      render 'new'
    end
  end

  def show
  end

  def edit
  end

  def update
    if @pic.update(pic_params)
      redirect_to pic_path(@pic)
    else
      render 'edit'
    end
  end

  def destroy
    @pic.destroy
    redirect_to pics_path
  end

  private

  def pic_params
    params.require(:pic).permit(:title, :description, :photo)
  end

  def find_pic
    @pic = Pic.find(params[:id])
  end
end
