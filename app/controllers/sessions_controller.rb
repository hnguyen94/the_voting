# frozen_string_literal: true

class SessionsController < ApplicationController
  def create
    user = if omniauth?
             User.from_omniauth(env['omniauth.auth'])
           else
             User.find_by(name: params[:session][:name])
           end

    if user
      session[:user_id] = user.id
      flash[:notice] = 'Successfully logged in'

      return redirect_to root_path
    end

    flash[:notice] = 'Invalid name. Please Sign up'

    redirect_to signup_path
  end

  def destroy
    session[:user_id] = nil
    flash[:alert] = 'Successfully logged out'

    redirect_to root_path
  end

  private

  def omniauth?
    !request.env['omniauth.auth'].nil?
  end
end
