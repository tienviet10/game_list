module Queries
  module UserGames
    class GetAllStatusUpdatesForAUser < Queries::BaseQuery
      description "Get all status updates for a user"

      type [Types::UserGame::StatusUpdateType], null: false

      def resolve()
        raise GraphQL::ExecutionError, "User not authenticated" unless context[:current_user]

        all_user_game = ::UserGame.where(user_id: context[:current_user])

        status_order_by_update = all_user_game.map do |user_game|
          user_game.status_updates.map do |status_update|
            status_update
          end
        end

        status_order_by_update.flatten.sort_by { |status| status["updated_at"] }.reverse
      rescue => e
        Rails.logger.error("Error retrieving all status updates for a user: #{e.message}")
        []
      end
    end
  end
end
