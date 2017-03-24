# frozen_string_literal: true
module ApplicationHelper
  def show_user_name
    # NOTE: Research for current_user&.name
    # current_user.name if current_user
    # current_user&.name
    "Signed in as #{current_user.name}" if current_user
  end

  def show_login_button
    return link_to('Logout', signout_path) if current_user
    link_to('Sign in with Facebook', '/auth/facebook')
  end
end
