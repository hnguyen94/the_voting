class Player < ApplicationRecord
  belongs_to :game
  belongs_to :user

  delegate :name, :image, to: :user
  delegate :text, to: :option, prefix: true, allow_nil: true
end
