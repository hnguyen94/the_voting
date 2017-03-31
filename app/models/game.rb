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

  def open?
    self.status == 'open'
  end

  def live?
    self.status == 'live'
  end

  def closed?
    self.status == 'closed'
  end

  def start?
    self.status == 'open' && self.players.count.positive?
  end

  def owner_name
    User.find_by(id: self.owner).name
  end
end
