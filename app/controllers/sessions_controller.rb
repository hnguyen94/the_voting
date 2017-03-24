# frozen_string_literal: true
class SessionsController < ApplicationController
  def create
    user = User.from_omniauth(env['omniauth.auth'])
    session[:user_id] = user.id
    flash[:notice] = 'Successfully logged in'
    redirect_to root_path
  end

  def destroy
    session[:user_id] = nil
    flash[:alert] = 'Successfully logged out'
    redirect_to root_path
  end
end
