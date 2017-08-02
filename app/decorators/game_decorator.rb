# frozen_string_literal: true

class GameDecorator < ApplicationDecorator
  delegate_all

  # Define presentation-specific methods here. Helpers are accessed through
  # `helpers` (aka `h`). You can override attributes, for example:
  #
  #   def created_at
  #     helpers.content_tag :span, class: 'time' do
  #       object.created_at.strftime("%a %m/%d/%y")
  #     end
  #   end

  decorates_finders

  def game_status
    game.status
  end

  def open?
    game_status == 'open'
  end

  def live?
    game_status == 'live'
  end

  def closed?
    game_status == 'closed'
  end
end
