class PhotosController < ApplicationController


  def index

    @photos = Photo.all


      @tests = Exiftool.new("https://photodata-dev.s3.amazonaws.com/uploads/photo/photo/5/IMG_0678.JPG")

    @photo = Photo.new
  end

  def new
    @photo = current_user.photos.new
  end

  def create
    @photos = Photo.all


    @photo = Photo.new(params.require(:photo).permit(:name, :photo, :user_id))
    if @photo.save
      redirect_to root_path
        else
          render :new
      end
  end


end
