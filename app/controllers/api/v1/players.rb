module API
  module V1
    class Players < Grape::API
      include API::V1::Defaults

      resource :players do
        desc 'Return all players'
        get '', root: :players do
          Player.all
        end

        desc 'Return a player'
        params do
          requires :id, type: String, desc: 'Id of the player'
        end

        get ':id', root: 'player' do
          Player.where(id: permitted_params[:id]).first!
        end
      end
    end
  end
end
