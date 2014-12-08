class Photo < ActiveRecord::Base
  belongs_to :user

  validates :name, :photo, presence: true
  mount_uploader :photo, PhotoUploader

  # def self.parse_location_data
  #   Post.all.each do |post|
  #     puts post.id
  #     begin
  #       exifr_jpeg = EXIFR::JPEG.new(post.photo_url)
  #       if exifr_jpeg.gps?
  #         puts "gps hit"
  #         post.gps_lat = exifr_jpeg.gps_lat
  #         post.gps_long = exifr_jpeg.gps_lng
  #         post.save!
  #       else
  #         puts "gps miss"
  #       end
  #     rescue
  #       puts "Rescued"
  #     end
  #   end
  # end
  #
  # def photo_url(thumbnail_size)
  #   external_photo_url || photo.url(thumbnail_size)
  # end
  #
  # def rotating?
  #   !self.rotation.nil? && self.rotate
  # end
  #
  # def self.poll_instagram_for_tuftag_user_photos
  #   users = User.where("instagram_access_token IS NOT NULL")
  #   users.each do |user|
  #     user.fetch_graffiti_photos
  #   end
  # end




end
