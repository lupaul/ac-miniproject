class Seminarphoto < ActiveRecord::Base
  belongs_to :seminar
  mount_uploader :image, ImageUploader
end
