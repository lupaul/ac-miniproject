class OrganizationsController < ApplicationController
  skip_authorization_check only: [:index, :show]

  def index
    @organizations = Organization.all
  end

  def show
    @organization = Organization.find(params[:id])
  end
end
