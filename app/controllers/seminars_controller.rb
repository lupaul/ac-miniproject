class SeminarsController < ApplicationController
  def index
    @seminars = Seminar.all
  end
  def new
    @seminar = Seminar.new
  end
  def create
    @seminar = Seminar.new(seminar_params)
    @seminar.save
    redirect_to seminars_path
  end

  def show
    @seminar = Seminar.find(params[:id])

  end

  def edit
    @seminar = Seminar.find(params[:id])
  end

  def update
    @seminar = Seminar.find(params[:id])
    @seminar.update(seminar_params)
    redirect_to seminar_path(@seminar)
  end

  def destroy
    @seminar = Seminar.find(params[:id])
    @seminar.destroy
    redirect_to seminars_path
  end

  private

  def seminar_params
    params.require(:seminar).permit(:name, :date, :location, :category)
  end
end
