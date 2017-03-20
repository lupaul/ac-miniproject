class Organization < ActiveRecord::Base
  has_one :organizationphoto
  has_many :seminars
  belongs_to :user
  has_many :organization_ships
  has_many :members, through: :organization_ships, source: :user

  accepts_nested_attributes_for :organizationphoto
end
