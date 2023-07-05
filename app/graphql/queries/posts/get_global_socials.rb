module Queries
  module Posts
    class GetGlobalSocials < Queries::BaseQuery
      description "Get global socials"

      type [Types::Social::SocialType], null: false

      argument :limit, Integer, required: false
      argument :offset, Integer, required: false

      def resolve(limit: nil, offset: nil)
        all_status_updates = ::StatusUpdate.where(nil)
        all_posts = ::Post.where(nil)

        mixed_results = (all_status_updates + all_posts).sort_by(&:updated_at).reverse

        results = apply_limit_and_offset(mixed_results, limit, offset)

        results
      end

      def apply_limit_and_offset(results, limit, offset)
        if limit.present?
          results = results.take(limit)
        end

        if offset.present?
          results = results.drop(offset)
        end

        results
      end

    end
  end
end

