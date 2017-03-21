class SeminarsController < ApplicationController
  before_action :authenticate_user!, only: [:new, :edit, :create, :update, :destroy]
  skip_authorization_check only: [:index, :show]
  # load_and_authorize_resource

  def index
    @seminars = Seminar.all

  end

  def new
    @seminar = Seminar.new
    @photo = @seminar.build_seminarphoto
  end

  def create
    @seminar = Seminar.new(seminar_params)
    @seminar.user = current_user
    if @seminar.save
      current_user.join!(@seminar)
      redirect_to seminars_path
    else
      render :new
    end
  end

  def show
    @seminar = Seminar.find(params[:id])
    @photo = @seminar.seminarphoto
    @conferences = @seminar.conferences

  end

  # def edit
  #   @seminar = Seminar.find(params[:id])
  #   # if current_user != @seminar.user
  #   #   redirect_to root_path, alert: "You have no permission!"
  #   # end
  #   if @seminar.seminarphoto.present?
  #     @photo = @seminar.seminarphoto
  #   else
  #     @photo = @seminar.build_seminarphoto
  #   end
  # end

  # def update
  #   @seminar = Seminar.find(params[:id])
  #   # if current_user != @seminar.user
  #   #   redirect_to root_path, alert: "You have no permission!!"
  #   # end
  #   if @seminar.update(seminar_params)
  #     redirect_to seminar_path(@seminar)
  #   else
  #     render :edit
  #   end
  # end

  # def destroy
  #   @seminar = Seminar.find(params[:id])
  #   # if current_user != @seminar.user
  #   #   redirect_to root_path, alert: "you have no permission!"
  #   # else
  #   #   @seminar.destroy
  #   #   redirect_to seminars_path
  #   # end
  #   @seminar.destroy
  #   redirect_to seminars_path
  #
  # end

  def join
    @seminar = Seminar.find(params[:id])

    if !current_user.is_member_of?(@seminar)
      current_user.join!(@seminar)
      flash[:notice] = "Join this action"
    else
      flash[:warning] = "You are in this action"
    end

    redirect_to seminar_path(@seminar)
  end

  def quit
    @seminar = Seminar.find(params[:id])

    if current_user.is_member_of?(@seminar)
      current_user.quit!(@seminar)
      flash[:alert] = "Already this action"
    else
      flash[:alert] = "本來就不是怎麼退出！？"
    end

    redirect_to seminar_path(@seminar)
  end

  private

  def seminar_params
    params.require(:seminar).permit(:name, :date, :location, :category,
                                    seminarphoto_attributes: [:image, :id])
  end
end
