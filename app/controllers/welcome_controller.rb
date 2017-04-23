# frozen_string_literal: true

require_dependency 'app/services/quote.rb'

class WelcomeController < ApplicationController
  def index
    @quote = Services::Quote.fetch

    redirect_to games_path if current_user
  end
end
