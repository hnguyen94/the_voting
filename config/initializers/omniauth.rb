# frozen_string_literal: true
OmniAuth.config.logger = Rails.logger

Rails.application.config.middleware.use OmniAuth::Builder do
  provider :facebook, '1818884588436079', '34cbe847fbee90e7c2ff319391f1dbc2',
           scope: 'public_profile',
           image_size: 'large'
end
