class User < ActiveRecord::Base
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :trackable, :validatable
  has_many :seminars
  has_many :conferences
  has_many :attendees
  has_many :seminar_relationships
  has_many :participated_seminars, through: :seminar_relationships,
            source: :seminar

  def admin?
    is_admin
  end
  
  def is_member_of?(seminar)
    participated_seminars.include?(seminar)
  end

  def join!(seminar)
    participated_seminars << seminar
  end

  def quit!(seminar)
    participated_seminars.delete(seminar)
  end
end
