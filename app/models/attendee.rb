class Attendee < ActiveRecord::Base
  validates :name, presence: true
  belongs_to :user
  belongs_to :seminar
end
