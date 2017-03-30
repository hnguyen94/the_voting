# frozen_string_literal: true
class Player < ApplicationRecord
  acts_as_voter
  acts_as_voteable

  belongs_to :game
  belongs_to :user

  delegate :name, :image, to: :user
  delegate :text, to: :option, prefix: true, allow_nil: true

  def count_votes
    Vote.where(voter_id: self.id).count
  end

  def voted?
    count_votes == 1
  end
end
