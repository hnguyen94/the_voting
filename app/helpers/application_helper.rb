# frozen_string_literal: true

module ApplicationHelper
  def show_user_name
    current_user&.name
  end

  def show_login_button
    return link_to 'Logout', signout_path if current_user
    link_to 'Sign in', login_path
  end
end
