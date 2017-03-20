class Admin::OrganizationsController < ApplicationController
  layout "admin"
  skip_authorization_check


  def index
    @organizations = Organization.all
  end

  def new
    @organization = Organization.new

  end

  def create
    @organization = Organization.new(organizaton_params)
    @organization.user = current_user
    if @organizaiton.save
      flash[:notice] = "Success created!"
      redirect_to admin_organizations_path
    else
      flash[:alert] = "Something was wrong!!"
      render :new
    end
  end

  def show
    @organization = Organization.find(params[:id])
  end

  private

  def organization_params
    params.require(:organization).permit(:name, :date, :location, :category)
  end
end
