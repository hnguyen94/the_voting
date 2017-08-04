module API
  module V1
    class Games < Grape::API
      include API::V1::Defaults

      resource :games do
        desc 'Return all games'
        get '', root: :games do
          Game.all
        end

        desc 'Return a game'
        params do
          requires :id, type: String, desc: 'Id of the game'
        end

        get ':id', root: 'game' do
          Game.where(id: permitted_params[:id]).first!
        end
      end
    end
  end
end
