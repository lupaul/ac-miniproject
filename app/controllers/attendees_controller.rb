class AttendeesController < ApplicationController
  
  def new
    @seminar = Seminar.find(params[:seminar_id])
    @attendee = Attendee.new
  end

  def create
    @seminar = Seminar.find(params[:seminar_id])
    @attendee = Attendee.new(attendee_params)
    @attendee.seminar = @seminar
    @attendee.user = current_user
    if @attendee.save
      redirect_to seminar_path(@seminar)
    else
      render :new
    end
  end

  private

  def attendee_params
    params.require(:attendee).permit(:name)
  end
end
