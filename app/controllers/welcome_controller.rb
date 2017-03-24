class WelcomeController < ApplicationController
  def index
    redirect_to games_path if current_user
  end
end
