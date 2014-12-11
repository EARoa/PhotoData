class Photo < ActiveRecord::Base

  belongs_to :user

  validates :name, :photo, presence: true
  mount_uploader :photo, PhotoUploader
end
