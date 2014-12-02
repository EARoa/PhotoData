class PhotosController < ApplicationController
  def index
  end

  def new
    @photo = Photo.new
  end

  def create
    @photo = Photo.new(params.require(:photo).permit(:name, :photo))
    # if @photo.save
    #   redirect_to root_path
    # else
    #   render :new
    # end
  end

  def new
    @photo = Photo.all
  end


end
