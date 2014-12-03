class PhotosController < ApplicationController


  def index
      @photos = Photo.all
      @photo = Photo.new
  end

  def create
    @photos = Photo.all
    @photo = Photo.new

    @photo = Photo.new(params.require(:photo).permit(:name, :photo))
    if @photo.save
      redirect_to root_path
        else
          render :new
      end
  end


end
