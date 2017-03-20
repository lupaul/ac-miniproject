class Organization < ActiveRecord::Base
  belongs_to :user
  has_many :organization_ships
  has_many :members, through: :organization_ships, source: :user
end
