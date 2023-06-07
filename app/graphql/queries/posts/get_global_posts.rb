module Queries
  module Posts
    class GetGlobalPosts < Queries::BaseQuery
      description "Get global posts"

      type [Types::Post::PostType], null: false

      def resolve()
        all_posts = ::Post.all

        all_posts.sort_by { |post| post["updated_at"] }.reverse
      rescue => e
        Rails.logger.error("Error retrieving global posts: #{e.message}")
        []
      end
    end
  end
end
