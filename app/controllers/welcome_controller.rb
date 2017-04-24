# frozen_string_literal: true

class WelcomeController < ApplicationController
  def index
    @quote = QuoteService::QuoteApi.fetch

    redirect_to games_path if current_user
  end
end
