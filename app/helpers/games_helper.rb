# frozen_string_literal: true
module GamesHelper
  GAME_LABEL_CLASSES = {
    open: 'label-info',
    live: 'label-success',
    closed: 'label-danger'
  }.freeze

  def current_user_game_owner?(game, user_id)
    game.owner == user_id
  end

  def status_label_for(game)
    label_state = GAME_LABEL_CLASSES[game.status.to_sym]
    content_tag(:span, game.status.humanize, class: ['pull-right', 'label', label_state])
  end
end
