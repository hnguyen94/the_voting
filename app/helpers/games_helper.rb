# frozen_string_literal: true
module GamesHelper
  GAME_LABEL_CLASSES = {
    open: 'label-info',
    live: 'label-success',
    closed: 'label-danger'
  }.freeze

  # NOTE: Method used?
  # def get_player_from_user(game, user_id)
  #   player = game.players.find_all { |player| player.user_id == user_id }
  # end

  def current_user_game_owner?(game, user_id)
    game.owner == user_id
  end

  def status_label_for(game)
    label_state = GAME_LABEL_CLASSES[game.status.to_sym]
    content_tag(:span, game.status.humanize, class: ['pull-right', 'label', label_state])
  end
end
