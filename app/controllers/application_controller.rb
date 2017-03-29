# frozen_string_literal: true
class ApplicationController < ActionController::Base
  protect_from_forgery with: :exception

  protected

  def logged_in?
    redirect_to root_path unless current_user
  end

  private

  def current_user
    if session[:user_id]
      @current_user ||= User.find(session[:user_id])
    else
      nil
    end
  end

  helper_method :current_user
end
