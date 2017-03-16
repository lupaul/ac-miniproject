class Conference < ActiveRecord::Base
  belongs_to :seminar
  belongs_to :user
end
