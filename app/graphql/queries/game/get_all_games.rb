module Queries
  module Game
    class GetAllGames < Queries::BaseQuery
      description "Get all games"
      type [Types::Game::GameType], null: false

      argument :platform, [String], required: false
      argument :genre, [String], required: false
      argument :tag, [String], required: false
      argument :year, Integer, required: false
      argument :search, String, required: false
      argument :sort_by, String, required: false

      def resolve(platform: nil, genre: nil, tag: nil, year: nil, search: nil, sort_by: nil)
        allGames = ::Game.all

        # Determine if the game is added by the user
        # user = ::User.find_by(id: context[:current_user])
        # if user.present?
        #   allGames = allGames.map do |game|
        #     game.is_game_added = user.user_games.exists?(game_id: game.id)
        #     game
        #   end
        # else
        #   allGames = allGames.map do |game|
        #     game.isGameAdded = false
        #     game
        #   end
        # end

        # Return games by platform if platform argument is provided
        if (platform.present?)
          allGames = add_filter(allGames, :platforms, :name, platform)
        end

        # Return games by genre if genre argument is provided
        if (genre.present?)
          allGames = add_filter(allGames, :genres, :name, genre)
        end

        # Return games by tag if tag argument is provided
        if (tag.present?)
          allGames = add_filter(allGames, :tags, :name, tag)
        end

        # Return games by tag if year argument is provided
        if (year.present?)
          allGames = allGames.where('EXTRACT(YEAR FROM "releaseDate") = ?', year)
        end

        # Perform text search if search argument is provided
        if (search.present?)
          allGames = allGames.where("name ILIKE ?", "%#{search}%")
        end

        if (sort_by.present?)
          case sort_by
          when "name"
            allGames = allGames.order(name: :asc)
          when "newest_releases"
            allGames = allGames.order(releaseDate: :desc)
          when "oldest_releases"
            allGames = allGames.order(releaseDate: :asc)
          when "avg_score"
            allGames = allGames.order(avg_score: :desc)
          when "total_rating"
            allGames = allGames.order(total_rating: :desc)
          end
        end

        return allGames.distinct.group("games.id")
      end

      def add_filter(games_table, table_type, column_name, value)
        value = value.uniq
        games_table.joins(table_type).where(table_type => { column_name => value }).having("COUNT(DISTINCT #{table_type}.#{column_name}) = ?", value.length)
      end
    end
  end
end
