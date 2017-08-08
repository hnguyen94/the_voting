module API
  module V1
    class Votes < Grape::API
      include API::V1::Defaults

      resource :votes do
        desc 'Return all votes'
        get '', root: :votes do
          Vote.all
        end
      end
    end
  end
end
