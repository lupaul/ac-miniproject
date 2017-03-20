class Organizationphoto < ActiveRecord::Base
  belongs_to :organization
  mount_uploader :image, ImageUploader
end
