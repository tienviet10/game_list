module Queries
  module UserGames
    class GamesByStatusForAUser < Queries::BaseQuery
      description "Get games by status for a user"
      type Types::UserGame::UserGamesByStatusType, null: false

      def resolve()
        raise GraphQL::ExecutionError, "User not authenticated" unless context[:current_user]

        playing = fetch_games_by_status(:Playing)
        planning = fetch_games_by_status(:Planning)
        completed = fetch_games_by_status(:Completed)
        paused = fetch_games_by_status(:Paused)
        dropped = fetch_games_by_status(:Dropped)
        justAdded = fetch_games_by_status(nil)

        playingCount = playing.count
        planningCount = planning.count
        completedCount = completed.count
        pausedCount = paused.count
        droppedCount = dropped.count
        justAddedCount = justAdded.count

        begin
          {
            "playing" => playing,
            "planning" => planning,
            "completed" => completed,
            "paused" => paused,
            "dropped" => dropped,
            "justAdded" => justAdded,
            "playingCount" => playingCount,
            "planningCount" => planningCount,
            "completedCount" => completedCount,
            "pausedCount" => pausedCount,
            "droppedCount" => droppedCount,
            "justAddedCount" => justAddedCount,
            "totalCount" => playingCount + planningCount + completedCount + pausedCount + droppedCount + justAddedCount,

            "listsOrder" => ::User.find_by(id: context[:current_user]).listsOrder,
            "errors": [],
          }
        rescue => e
          Rails.logger.error("Error retrieving games by status: #{e.message}")
          {
            "playing" => [],
            "planning" => [],
            "completed" => [],
            "paused" => [],
            "dropped" => [],
            "justAdded" => [],
            "playingCount" => 0,
            "planningCount" => 0,
            "completedCount" => 0,
            "pausedCount" => 0,
            "droppedCount" => 0,
            "justAddedCount" => 0,
            "totalCount" => 0,
            "listsOrder" => "",
            "errors": [e.message],
          }
        end
      end

      private

      def fetch_games_by_status(status)
        ::UserGame.where(user_id: context[:current_user], game_status: status).map(&:game)
      end
    end
  end
end
