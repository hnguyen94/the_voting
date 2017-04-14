# frozen_string_literal: true

class PlayersController < ApplicationController
  before_filter :set_game, except: [:index]
  before_filter :set_current_player, only: [:upvote, :unvote, :destroy]
  before_filter :set_player, only: [:destroy, :upvote, :unvote]

  def index
    @players = Player.all
  end

  def create
    @player = @game.players.create(user_id: current_user.id)

    redirect_to game_path(@game)
  end

  def destroy
    @player.destroy

    redirect_to game_path(@game)
  end

  def upvote
    if current_user.id == @player.user_id
      flash[:alert] = "You can'vote on yourself. Please vote someone else"

      return redirect_to game_path(@game)
    end

    @current_player.vote_for @player
    @player.update(votes: @player.votes_count)

    flash[:notice] = 'You have voted!'
    redirect_to game_path(@game)
  end

  def unvote
    @current_player.unvote_for @player
    @player.update(votes: @player.votes_count)

    flash[:notice] = 'You have unvoted!'
    redirect_to game_path(@game)
  end

  private

  def set_player
    @player = Player.find_by!(id: params[:id])
  end

  def set_game
    @game = Game.find(params[:game_id])
  end

  def set_current_player
    @current_player = Player.find_by!(user_id: current_user.id)
  end
end
