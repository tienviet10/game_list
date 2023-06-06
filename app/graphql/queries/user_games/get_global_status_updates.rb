module Queries
  module UserGames
    class GetGlobalStatusUpdates < Queries::BaseQuery
      description "Get global status updates"

      type [Types::UserGame::StatusUpdateType], null: false

      def resolve()
        all_status_changes = ::StatusUpdate.all

        all_status_changes.sort_by { |status| status["updated_at"] }.reverse
      rescue => e
        Rails.logger.error("Error retrieving global status updates: #{e.message}")
        []
      end
    end
  end
end
