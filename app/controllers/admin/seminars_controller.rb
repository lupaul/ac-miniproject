class Admin::SeminarsController < ApplicationController
  # before_action :authenticate_user!
  # before_action :admin_required
  load_and_authorize_resource
  layout "admin"
  def index
    @seminars = Seminar.all
  end

  def new
    @organization_names = Organization.all
    @seminar = Seminar.new
    @photo = @seminar.build_seminarphoto

  end

  def show
    @seminar = Seminar.find(params[:id])
    @photo = @seminar.seminarphoto
    @conferences = @seminar.conferences
  end

  def create
    # @ogid = current_user.organization.id

    @seminar = Seminar.new(seminar_params)
    # @seminar.organization = Organization.find(current_user)
    @seminar.user = current_user
    if @seminar.save
      redirect_to admin_organization_path(@seminar.organization_id)
    else
      render :new
    end
  end

  def edit
    @seminar = Seminar.find(params[:id])
    if @seminar.seminarphoto
      @photo = @seminar.seminarphoto
    else
      @photo = @seminar.build_seminarphoto
    end
  end

  def update
    @seminar = Seminar.find(params[:id])
    # if current_user != @seminar.user
    #   redirect_to root_path, alert: "You have no permission!!"
    # end
    if @seminar.update(admin_seminar_params)
      redirect_to admin_seminars_path
    else
      render :edit
    end
  end

  def destroy
    @seminar = Seminar.find(params[:id])
    # if current_user != @seminar.user
    #   redirect_to root_path, alert: "you have no permission!"
    # else
    #   @seminar.destroy
    #   redirect_to seminars_path
    # end
    @seminar.destroy
    redirect_to admin_seminars_path

  end




  private

  def seminar_params
    params.require(:seminar).permit(:name, :date, :location, :category, :organization_id, seminarphoto_attributes: [:image, :id])
  end
end
