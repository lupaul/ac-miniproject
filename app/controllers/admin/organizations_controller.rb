class Admin::OrganizationsController < ApplicationController
  layout "admin"
  skip_authorization_check


  def index
    @organizations = Organization.all
  end

  def new
    @organization = Organization.new
    @organizationphoto = @organization.build_organizationphoto

  end

  def create
    @organization = Organization.new(organization_params)
    @organization.user = current_user
    if @organization.save
      flash[:notice] = "Success created!"
      redirect_to admin_organizations_path
    else
      flash[:alert] = "Something was wrong!!"
      render :new
    end
  end

  def show
    @organization = Organization.find(params[:id])
    @photo = @organization.organizationphoto
    @seminars = @organization.seminars 
  end

  private

  def organization_params
    params.require(:organization).permit(:name, :date, :location, :category,
                                      organizationphoto_attributes: [:image, :id])
  end
end
