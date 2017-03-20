class Seminar < ActiveRecord::Base
  resourcify
  belongs_to :organization
  has_one :seminarphoto
  has_many :conferences
  has_many :attendees
  has_many :seminar_relationships
  has_many :members, through: :seminar_relationships, source: :user
  belongs_to :user

  accepts_nested_attributes_for :seminarphoto
end
