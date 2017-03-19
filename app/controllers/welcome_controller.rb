class WelcomeController < ApplicationController
  skip_authorization_check only: :index
  def index
    # flash[:alert] = "good morning!"
  end

end
