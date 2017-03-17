class Admin::SeminarsController < ApplicationController
  before_action :authenticate_user!
  before_action :admin_required

  
end
