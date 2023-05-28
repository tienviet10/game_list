module Types
  module Like
    class LikeableType < Types::BaseUnion
      possible_types Types::UserGame::StatusUpdateType, Types::User::FollowType
      def self.resolve_type(object, context)
        p "object: #{object}"
        case object.class.name
        when "StatusUpdate"
          Types::UserGame::StatusUpdateType
        when "Follow"
          Types::User::FollowType
        end
      end
    end
  end
end
