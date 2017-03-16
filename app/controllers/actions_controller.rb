class ActionsController < ApplicationController
  def new
    @seminar = Seminar.find(params[:seminar_id])
    @action = Action.new
  end

  def create
    @seminar = Seminar.find(params[:seminar_id])
    @action = Action.new(action_params)
    @action.seminar = @seminar
    @action.user = current_user
    if @action.save
      flah[:notice] = "成功開啟報名活動"
      redirect_to seminar_path(@seminar)
    else
      render :new
    end
  end

  private

  def action_params

    params.require(:action).permit(:name)

  end
end
