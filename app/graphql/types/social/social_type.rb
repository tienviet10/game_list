module Types
  module Social
    class SocialType < Types::BaseUnion
      possible_types Types::Post::PostType, Types::UserGame::StatusUpdateType

      def self.resolve_type(object, _context)
        if object.is_a?(::Post)
          Types::Post::PostType
        elsif object.is_a?(::StatusUpdate)
          Types::UserGame::StatusUpdateType
        else
          # Handle other types if necessary
          raise "Unexpected object type: #{object.class}"
        end
      end
    end
  end
end
