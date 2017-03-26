# frozen_string_literal: true
class PlayersController < ApplicationController
  before_filter :find_game_params, only: [:create, :destroy]

  def index
    @players = Player.all
  end

  def create
    @player = @game.players.create(user_id: current_user.id)
    redirect_to game_path(@game)
  end

  def destroy
    @player = Player.find_by!(user_id: params[:id])
    @player.destroy
    redirect_to game_path(@game)
  end

  def upvote
    @player.upvote_from current_user
    redirect_to games_path
  end

  private

  def player_params
    params.require(:player).permit(:user_id)
  end

  def find_game_params
    @game = Game.find(params[:game_id])
  end
end
