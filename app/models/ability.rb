class Ability
  include CanCan::Ability

  def initialize(user)
    # Define abilities for the passed in user here. For example:
    #
    #   user ||= User.new # guest user (not logged in)
    #   if user.admin?
    #     can :manage, :all
    #   else
    #     can :read, :all
    #   end
    #
    # The first argument to `can` is the action you are giving the user
    # permission to do.
    # If you pass :manage it will apply to every action. Other common actions
    # here are :read, :create, :update and :destroy.
    #
    # The second argument is the resource the user can perform the action on.
    # If you pass :all it will apply to every resource. Otherwise pass a Ruby
    # class of the resource.
    #
    # The third argument is an optional hash of conditions to further filter the
    # objects.
    # For example, here the user can only update published articles.
    #
    #   can :update, Article, :published => true
    #
    # See the wiki for details:
    # https://github.com/CanCanCommunity/cancancan/wiki/Defining-Abilities
    #:manage: 是指這個 controller 內所有的 action
    #:read :  指 :index 和 :show
    #:update: 指 :edit  和 :update
    #:destroy:指 :destroy
    #:create: 指 :new   和 :crate

    # if user.blank?     # not logged in
    if user.blank? || user.has_role?(:user)
      # can [:new, :create], Seminar #可以執行 Form Controller 裡的 new 和 create action
      # cannot [:new], Comment  #無法執行 Comment Controller 裡的 new action
      # basic_read_only #呼叫基本權限設定 Medthod

    elsif user.has_role?(:admin) #如果 role 為 admin
      can [:read, :create, :update], [Seminar,Conference]
      # can :manage, :all #可管理所有資源
    elsif user.has_role?(:systemadmin) #如果 role 為 admin
      can :manage, :all #可管理所有資源
    end

  end

  protected

  def basic_read_only
    can :read, Seminar
  end
end
