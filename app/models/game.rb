# frozen_string_literal: true
class Game < ApplicationRecord
  has_many :players, dependent: :destroy
  has_many :users, through: :players

  validates :title, presence: true,
                    length: { minimum: 1 }
  validates :status, inclusion: { in: %w(open live closes),
                                  message: '%{value} is not a valid status' }

  default_scope { order('created_at DESC') }

  def participating?(user)
    !!players.find_by(user_id: user)
  end
end
