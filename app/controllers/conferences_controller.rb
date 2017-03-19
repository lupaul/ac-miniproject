class ConferencesController < ApplicationController
  skip_authorization_check only: :show
  # load_and_authorize_resource
  def new
    @seminar = Seminar.find(params[:seminar_id])
    @conference = Conference.new
  end

  def show
    @seminar = Seminar.find(params[:seminar_id])
    @conference = @seminar.conferences.find(params[:id])
  end

  def create
    @seminar = Seminar.find(params[:seminar_id])
    @conference = Conference.new(conference_params)
    @conference.seminar = @seminar
    @conference.user = current_user
    if @conference.save
      flash[:notice] = "成功創建一場 Conference 活動"
      redirect_to seminar_path(@seminar)
    else
      render :new
    end
  end

  def edit
    @seminar = Seminar.find(params[:seminar_id])
    @conference = @seminar.conferences.find(params[:id])
  end

  def update
    @seminar = Seminar.find(params[:seminar_id])
    @conference = @seminar.conferences.find(params[:id])
    if @conference.update(conference_params)
      flash[:notice] = "U success update!!"
      redirect_to seminar_conference_path(@seminar,@conference)
    else
      render :edit
    end
  end


  def destroy
    @seminar = Seminar.find(params[:seminar_id])
    @conference = @seminar.conferences.find(params[:id])
    if @conference.destroy
      flash[:alert] = "Already delete no.#{@conference.id},  Conference name: #{@conference.name}"
      redirect_to seminar_path(@seminar)
    end
  end

  private

  def conference_params
    params.require(:conference).permit(:name, :date, :location, :category)

  end
end
