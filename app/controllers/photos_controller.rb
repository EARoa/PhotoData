class PhotosController < ApplicationController


  def index

    @photos = Photo.all

    # @tests = Exiftool.new("https://photodata-dev.s3.amazonaws.com/uploads/photo/photo/5/IMG_0678.JPG")
    @photos.each do |photo|

      open("#{photo.photo}")

      tempfile = []

      url = "#{photo.photo}"


      file = Tempfile.new('photodata').tap do |file|
        file.binmode
        # must be in binary mode
        file.rewind
      end
      file.write(open(url).read)
      @test = Exiftool.new(file.path)
      photo.size = @test.to_hash[:file_size]
      photo.shutter = @test.to_hash[:shutter_speed_value]

    end
  end

  def new
    @photo = current_user.photos.new
  end

  def create
    @photos = Photo.all


    @photo = Photo.new(params.require(:photo).permit(:name, :photo, :user_id, :size, :shutter))
    if @photo.save
      redirect_to root_path
        else
          render :new
      end
  end


end
