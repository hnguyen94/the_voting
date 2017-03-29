# frozen_string_literal: true
class Player < ApplicationRecord
  acts_as_voter
  acts_as_voteable

  belongs_to :game
  belongs_to :user

  delegate :name, :image, to: :user
  delegate :text, to: :option, prefix: true, allow_nil: true
end
