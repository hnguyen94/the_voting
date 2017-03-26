class PlayersController < ApplicationController
  def index
    @players = Player.all
  end

  def create
    @game = Game.find(params[:game_id])
    @player = @game.players.create(user_id: current_user.id)
    redirect_to game_path(@game)
  end

  def destroy
    @game = Game.find(params[:game_id])
    @player = @game.players.create(user_id: current_user.id)
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
end
