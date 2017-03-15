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

  def edit
    @seminar = Seminar.find(params[:seminar_id])
    @attendee = @seminar.attendees.find(params[:id])

  end

  def update
    @seminar = Seminar.find(params[:seminar_id])
    @attendee = @seminar.attendees.find(params[:id])
    if @attendee.update(attendee_params)
      redirect_to seminar_path(@seminar)
    else
      render :edit
    end
  end

  def destroy
    @seminar = Seminar.find(params[:seminar_id])
    @attendee = @seminar.attendees.find(params[:id])
    if @attendee.destroy
      redirect_to seminar_path(@seminar)
    end
  end

  private

  def attendee_params
    params.require(:attendee).permit(:name)
  end
end
