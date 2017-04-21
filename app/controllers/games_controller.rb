# frozen_string_literal: true

class GamesController < ApplicationController
  before_filter :find_game_params, only: [:show, :update, :destroy, :start, :close, :show_results, :reset_votes]
  before_filter :set_current_player, only: [:reset_votes]
  before_filter :ensure_logged_in

  def index
    @games = Game.all
  end

  def show
    if !current_user_in_game? && @game.live? && @game.owner != current_user.id
      flash[:alert] = 'You can not enter a running game!'

      return redirect_to games_path
    end

    @current_player = Player.find_by(user_id: current_user.id)
  end

  def new
    @game = Game.new
  end

  def edit; end

  def create
    @game = Game.new(game_params)
    @game.owner = current_user.id

    if @game.save
      redirect_to @game
    else
      render 'new'
    end
  end

  def update
    if @game.update(game_params)
      redirect_to @game
    else
      render 'edit'
    end
  end

  def destroy
    @game.destroy

    redirect_to games_path
  end

  def start
    Game.update(@game.id, status: 'live')

    redirect_to @game
  end

  def close
    Game.update(@game.id, status: 'closed')

    redirect_to @game
  end

  def show_results
    if Vote.all.count != @game.players.count
      flash[:alert] = 'Not everyone has voted'

      return
    end

    render 'players/_player', game: @game, layout: false
  end

  def reset_votes
    if current_user.id == @game.owner
      Vote.delete_all
      flash[:notice] = 'Votes resetted'
    end

    render 'players/_player', game: @game, layout: false
  end

  private

  def current_user_in_game?
    @game.players.include?(Player.find_by(user_id: current_user.id))
  end

  def set_current_player
    @current_player = Player.find_by!(user_id: current_user.id)
  end

  def find_game_params
    @game = Game.find(params[:id])
  end

  def game_params
    params.require(:game).permit(:title, :description, :status)
  end
end
