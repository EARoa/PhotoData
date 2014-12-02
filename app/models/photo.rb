class Photo < ActiveRecord::Base
  validates :name, :photo, presence: true
  mount_uploader :photo, PhotoUploader
  

end
