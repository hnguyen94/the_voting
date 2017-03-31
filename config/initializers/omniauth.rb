# frozen_string_literal: true
OmniAuth.config.logger = Rails.logger

Rails.application.config.middleware.use OmniAuth::Builder do
  provider :facebook, ENV['app_id'], ENV['secret_id'],
           scope: 'public_profile',
           image_size: 'square'
end
