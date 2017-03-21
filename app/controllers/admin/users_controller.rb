class Admin::UsersController < ApplicationController
  layout "admin"
  # before_action :authenticate_user!
  # before_action :admin_required
  load_and_authorize_resource
  def index
    @users = User.where('id >1 ')
    @organizations = Organization.all
    # @seminars = 
  end

  def to_admin

    @user = User.find(params[:id])
    @user.to_admin

    redirect_to admin_users_path
  end

  def to_user

    @user = User.find(params[:id])
    @user.to_user

    redirect_to admin_users_path
  end
end
