module Types
  module Comment
    class CommentableType < Types::BaseUnion
      possible_types Types::UserGame::StatusUpdateType, Types::Post::PostType
      def self.resolve_type(object, context)
        case object.class.name

        when "StatusUpdate"
          Types::UserGame::StatusUpdateType
        when "Post"
          Types::Post::PostType
        when "Comment"
          Types::Comment::CommentType
        end
      end
    end
  end
end
