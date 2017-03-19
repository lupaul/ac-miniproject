class Admin::ConferencesController < ApplicationController
  load_and_authorize_resource
  layout "admin"

  def new
    @seminar = Seminar.find(params[:seminar_id])
    @conference = Conference.new
  end
end
