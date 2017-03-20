class User < ActiveRecord::Base
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :trackable, :validatable
  has_many :organizations
  has_many :organization_ships
  has_many :participated_organizations, through: :organization_ships,
            source: :organization       
  has_many :seminars
  has_many :conferences
  has_many :attendees
  has_many :seminar_relationships
  has_many :participated_seminars, through: :seminar_relationships,
            source: :seminar
  # has_many :roles, through: :users_roles
  rolify :before_add => :before_add_method

  def before_add_method(role)

  end
  after_create :assign_default_role

  def assign_default_role
    self.add_role(:user) if self.roles.blank?
  end

  def to_admin
    self.remove_role :user
    self.add_role :admin
  end

  def to_user
    self.remove_role :admin
    self.add_role :user
  end

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
