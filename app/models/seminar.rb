class Seminar < ActiveRecord::Base
  belongs_to :user
  has_many :attendees
  has_many :seminar_relationships
  has_many :members, through: :seminar_relationships, source: :user
end
