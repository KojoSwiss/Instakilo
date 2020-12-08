class PicsController < ApplicationController

  def index
    @pics = Pic.all
  end

  def new
    @pic = Pic.new
  end

  def create
    @pic = Pic.new(pic_params)
    if @pic.save
      redirect_to pic_path(@pic)
    else
      render 'new'
    end
  end

  private

  def pic_params
    params.require(:pic).permit(:title, :description)
  end
end
