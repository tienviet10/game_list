module Queries
  module Posts
    class GetGlobalSocials < Queries::BaseQuery
      description "Get global socials"

      type [Types::Social::SocialType], null: false

      argument :limit, Integer, required: false
      argument :offset, Integer, required: false
      argument :type, String, required: false

      def resolve(limit: nil, offset: nil, type: nil)
        all_status_updates = ::StatusUpdate.where(nil)
        all_posts = ::Post.where(nil)

        if type.present? && type == 'private' && context[:current_user].present?

          user_games = ::User.find(context[:current_user]).user_games

          all_status_updates =::StatusUpdate.where(user_game_id: user_games.pluck(:id))
          all_posts = ::Post.where(user_id: context[:current_user])
        end

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

