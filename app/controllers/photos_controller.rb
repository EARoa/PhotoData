class PhotosController < ApplicationController


  def index
    @photos = Photo.all

    @photos.each do |photo|

      open("#{photo.photo}")

      tempfile = []

      url = "#{photo.photo}"


      file = Tempfile.new('photodata').tap do |file|
        file.binmode
        file.rewind
      end
      file.write(open(url).read)
      @test = Exiftool.new(file.path)
      photo.size = @test.to_hash[:file_size]
      photo.shutter = @test.to_hash[:shutter_speed_value]

      photo.camera = @test.to_hash[:camera]
      photo.make = @test.to_hash[:make]
      photo.model = @test.to_hash[:model]
      photo.iso = @test.to_hash[:iso]

      photo.aperture_value = @test.to_hash[:aperture_value]



      photo.focal_length_in35mm_format = @test.to_hash[:focal_length_in35mm_format]
    end
  end

  def new
    @photo = current_user.photos.new
  end

  def create
    @photos = Photo.all


    @photo = Photo.new(params.require(:photo).permit(
                                                      :name,
                                                      :photo,
                                                      :user_id,
                                                      :size,
                                                      :shutter,
                                                      :focal_length_in35mm_format,
                                                      :aperture_value,
                                                      :camera,
                                                      :make,
                                                      :model,
                                                      :iso,
                                                      :exposure,
                                                      ))





    if @photo.save
      redirect_to root_path
        else
          render :new
      end
  end


end
