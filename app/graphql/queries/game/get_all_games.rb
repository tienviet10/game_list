module Queries
  module Game
    class GetAllGames < Queries::BaseQuery
      description "Get all games"
      type [Types::Game::GameType], null: false

      argument :platform, [String], required: false
      argument :genre, [String], required: false
      argument :tag, [String], required: false
      argument :excludedPlatforms, [String], required: false
      argument :excludedGenres, [String], required: false
      argument :excludedTags, [String], required: false
      argument :year, Integer, required: false
      argument :search, String, required: false
      argument :sortBy, String, required: false

      def resolve(platform: nil, genre: nil, tag: nil, excludedPlatforms: nil, excludedGenres: nil, excludedTags: nil, year: nil, search: nil, sortBy: nil)
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

        if (excludedPlatforms.present?)
          #   excluded_games_query = <<-SQL
          #   SELECT *
          #   FROM games
          #   WHERE id NOT IN (
          #     SELECT game_id
          #     FROM games_genres
          #     INNER JOIN genres ON games_genres.genre_id = genres.id
          #     WHERE genres.name IN (?)
          #   )
          # SQL

          #allGames = allGames.where.not(id: allGames.joins(:platforms).where(platforms: { name: excludedPlatforms }))
          allGames = exclude_filter(allGames, :platforms, :name, excludedPlatforms)

          # allGames = exclude_filter(allGames, :platforms, :name, excludedPlatforms)
          # allGames = allGames.joins(:platforms)
          #   .where.not(platforms: { name: excludedPlatforms })
          #
          # testGames = ::Game.exclude_games_by_genre_names(excludedPlatforms)
          # # testGames.inspect
          # # puts testGames
          # testGames.each do |gamee|
          #   puts gamee
          # end

          # allGames = testGames
          # return allGames
          # allGames = allGames.joins(:platforms).where(platforms: { name: excludedPlatforms })
          # allGames = Game.exclude_games_by_genre_names(excludedPlatforms)
          # allGames = allGames.joins(:platforms).where.not(platforms: { name: excludedPlatforms })
          # .having("COUNT(DISTINCT #{:platforms}.#{:name}) = ?", excludedPlatforms.length)
        end

        if (excludedGenres.present?)
          allGames = exclude_filter(allGames, :genres, :name, excludedGenres)
        end

        if (excludedTags.present?)
          allGames = exclude_filter(allGames, :tags, :name, excludedTags)
        end

        # Return games by tag if year argument is provided
        if (year.present?)
          allGames = allGames.where('EXTRACT(YEAR FROM "releaseDate") = ?', year)
        end

        # 4 -17
        # Perform text search if search argument is provided
        if (search.present?)
          allGames = allGames.where("games.name ILIKE ?", "%#{search}%")
        end

        if (sortBy.present?)
          case sortBy
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
        value = value.uniq.reject(&:empty?)
        if (value.length == 0)
          return games_table
        end
        games_table.joins(table_type).where(table_type => { column_name => value }).having("COUNT(DISTINCT #{table_type}.#{column_name}) = ?", value.length)
      end

      def exclude_filter(games_table, table_type, column_name, value)
        value = value.uniq.reject(&:empty?)
        if value.length == 0
          return games_table
        end

        games_table.where.not(id: games_table.joins(table_type).where(table_type => { column_name => value }))
        #   excluded_games_query = <<-SQL
        #   SELECT *
        #   FROM games
        #   WHERE id NOT IN (
        #     SELECT game_id
        #     FROM games_genres
        #     INNER JOIN genres ON games_genres.genre_id = genres.id
        #     WHERE genres.name IN (?)
        #   )
        # SQL
        # Article.where.not(title: ['Rails 3', 'Rails 5'])

        # games_table.joins(table_type)
        #   .where.not(table_type => { column_name => value })
        # .having("COUNT(DISTINCT #{table_type}.#{column_name}) = ?", value.length)
        # excluded_games = games_table.joins(table_type).where(table_type => { column_name => value }).select(:id)
        # games_table.where.not(id: excluded_games)
      end
    end
  end
end
