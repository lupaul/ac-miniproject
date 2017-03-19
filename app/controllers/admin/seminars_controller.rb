class Admin::SeminarsController < ApplicationController
  # before_action :authenticate_user!
  # before_action :admin_required
  load_and_authorize_resource
  layout "admin"
  def index
    @seminars = Seminar.all
  end

end
