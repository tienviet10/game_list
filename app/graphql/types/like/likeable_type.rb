module Types
  module Like
    class LikeableType < Types::BaseUnion
      possible_types Types::UserGame::StatusUpdateType, Types::User::FollowType, Types::Post::PostType,
                     Types::Game::GameType
      def self.resolve_type(object, context)
        case object.class.name

        when "Game"
          Types::Game::GameType
        when "StatusUpdate"
          # What is object when likeable_type = "StatusUpdate"
          # object: {
          #   id: "1",
          #   status_id: "2"
          #   user_game_id: "3"
          #   created_at: "2021-03-30T20:00:00.000Z"
          #   updated_at: "2021-03-30T20:00:00.000Z"
          # }

          Types::UserGame::StatusUpdateType
        when "Post"
          Types::Post::PostType
        when "Follow"
          Types::User::FollowType
        end
      end
    end
  end
end
