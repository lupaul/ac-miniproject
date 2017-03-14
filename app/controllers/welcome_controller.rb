class WelcomeController < ApplicationController
  def index
    flash[:alert] = "good morning!"
  end

end
