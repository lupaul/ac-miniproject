class Admin::SeminarsController < ApplicationController
  # before_action :authenticate_user!
  # before_action :admin_required
  load_and_authorize_resource
  layout "admin"
  def index
    @seminars = Seminar.all
  end

  def new
    @seminar = Seminar.new
  end

  def show
    @seminar = Seminar.find(params[:id])
    @conferences = @seminar.conferences
  end

  def create
    @seminar = Seminar.new(admin_seminar_params)
    @seminar.user = current_user
    if @seminar.save
      redirect_to admin_seminars_path
    else
      render :new
    end
  end

  # def edit
  #   @seminar =
  # end

  private

  def admin_seminar_params
    params.require(:seminar).permit(:name, :date, :location, :category)
  end
end
