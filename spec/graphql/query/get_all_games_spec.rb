require "rails_helper"

describe Queries::Game::GetAllGames, type: :request do
  describe "verify get all games query" do
    let!(:genre1) { create(:genre, name: "Action") }
    let!(:genre2) { create(:genre, name: "Sports") }
    let!(:genre3) { create(:genre, name: "Turn-based strategy") }
    let!(:genre4) { create(:genre, name: "Stealth") }
    let!(:genre5) { create(:genre, name: "Role-playing") }

    let!(:tag1) { create(:tag, name: "Multiplayer") }
    let!(:tag2) { create(:tag, name: "Singleplayer") }
    let!(:tag3) { create(:tag, name: "3D") }
    let!(:tag4) { create(:tag, name: "Fantasy") }
    let!(:tag5) { create(:tag, name: "NO_GAMES") } # This tag is used to test the case where no games are returned

    let!(:platform1) { create(:platform, name: "PlayStation 5") }
    let!(:platform2) { create(:platform, name: "Xbox One") }
    let!(:platform3) { create(:platform, name: "Windows") }
    let!(:platform4) { create(:platform, name: "Nintendo Switch") }
    let!(:platform5) { create(:platform, name: "macOS") }

    let!(:game1) {
      create(:game,
             name: "Persona 5",
             description: "Inside a casino, during one of their heists, the group known as Phantom Thieves of Hearts is cornered by the police. Unable to escape, the leader of the group (the game's protagonist) is put under arrest, and goes into interrogation.",
             imageURL: "https://www.mobygames.com/game/86408/persona-5/",
             bannerURL: "https://images.igdb.com/igdb/image/upload/t_screenshot_big/gin55k9eyfq8udk0taym.jpg",
             releaseDate: "2014-09-23",
             avg_score: 4.5,
             total_rating: 900,
             genres: [genre1, genre3, genre5],
             tags: [tag2, tag3, tag4],
             platforms: [platform1, platform2, platform3, platform4])
    }

    let!(:game2) {
      create(:game,
             name: "FIFA 11",
             description: "FIFA Soccer 11 is a licensed soccer game which allows the player to directly control his athletes. He has various playing modes to his disposal, e.g. single matches, multiplayer or leagues to prove his skill.",
             imageURL: "https://www.mobygames.com/game/51960/fifa-soccer-11/",
             bannerURL: "https://images.igdb.com/igdb/image/upload/t_screenshot_big/gin55k9eyfq8udk0taym.jpg",
             releaseDate: "2011-09-23",
             avg_score: 4.7,
             total_rating: 2000,
             genres: [genre2],
             tags: [tag1, tag3],
             platforms: [platform1, platform2, platform3])
    }

    let!(:game3) {
      create(:game,
             name: "Assassin's Creed",
             description: "Assassin's Creed is a non-linear action-adventure video game, during which the player controls a 12th-century Levantine Assassin named Ibn-La'Ahad during the Third Crusade, whose life is experienced through the Animus by his 21st century descendant, Desmond Miles.",
             imageURL: "https://www.igdb.com/games/assassin-s-creed/",
             bannerURL: "https://images.igdb.com/igdb/image/upload/t_screenshot_big/gin55k9eyfq8udk0taym.jpg",
             releaseDate: "2007-09-23",
             avg_score: 4.4,
             total_rating: 3000,
             genres: [genre1, genre4, genre5],
             tags: [tag2, tag3, tag4],
             platforms: [platform1, platform2, platform3])
    }

    let!(:game4) {
      create(:game,
             name: "Dark Souls: Remastered",
             description: "Then, there was fire. Re-experience the critically acclaimed, genre-defining game that started it all. Beautifully remastered, return to Lordran in stunning high-definition detail running at 60fps. Dark Souls Remastered includes the main game plus the Artorias of the Abyss DLC.",
             imageURL: "https://images.igdb.com/igdb/image/upload/t_cover_big/co2uro.png",
             bannerURL: "https://images.igdb.com/igdb/image/upload/t_screenshot_big/zqpwusikqtoeawmsdaqd.jpg",
             releaseDate: "2018-05-25",
             avg_score: 8.0,
             total_rating: 1000,
             genres: [genre1, genre5],
             tags: [tag2, tag3, tag4],
             platforms: [platform1, platform2, platform3])
    }

    let!(:game5) {
      create(:game,
             name: "The Legend of Zelda: Breath of the Wild",
             description: "Forget everything you know about The Legend of Zelda games. Step into a world of discovery, exploration and adventure in The Legend of Zelda: Breath of the Wild, a boundary-breaking new game in the acclaimed series.",
             imageURL: "https://images.igdb.com/igdb/image/upload/t_cover_big/co3p2d.png",
             bannerURL: "https://images.igdb.com/igdb/image/upload/t_screenshot_big/sckj6g.jpg",
             releaseDate: "2017-03-03",
             avg_score: 9.5,
             total_rating: 690,
             genres: [genre1, genre5],
             tags: [tag2, tag3, tag4],
             platforms: [platform4])
    }

    let!(:game6) {
      create(:game,
             name: "Dark Souls II Scholar of the First Sin",
             description: "Dark Souls II: Scholar of the First Sin is the complete Dark Souls II experience, adding to the 2014's critically acclaimed title, Dark Souls II not only its three DLC chapters; Crown Of The Sunken King, Crown Of The Old Iron King, and Crown Of The Ivory King but as well an array of all-new content.",
             imageURL: "https://images.igdb.com/igdb/image/upload/t_cover_big/co20um.png",
             bannerURL: "https://images.igdb.com/igdb/image/upload/t_screenshot_big/g8roegct3qyzmnubhoeb.jpg",
             releaseDate: "2015-04-02",
             avg_score: 8.5,
             total_rating: 850,
             genres: [genre1, genre5],
             tags: [tag2, tag3, tag4],
             platforms: [platform1, platform2, platform3])
    }

    let!(:game7) {
      create(:game,
             name: "Rocket League",
             description: "Rocket League is a high-powered hybrid of arcade-style soccer and vehicular mayhem with easy-to-understand controls and fluid, physics-driven competition. Rocket League includes casual and competitive Online Matches, a fully-featured offline Season Mode, special 'Mutators' that let you change the rules entirely, hockey and basketball-inspired Extra Modes, and more than 500 trillion possible cosmetic customization combinations.",
             imageURL: "https://images.igdb.com/igdb/image/upload/t_cover_big/co5w0w.png",
             bannerURL: "https://images.igdb.com/igdb/image/upload/t_screenshot_big/ygepetru87ka9nzqowr6.jpg",
             releaseDate: "2021-06-15",
             avg_score: 7.1,
             total_rating: 700,
             genres: [genre1, genre2],
             tags: [tag1, tag2, tag3],
             platforms: [platform1, platform2, platform3, platform4, platform5])
    }

    it "returns all games with their genres, platforms, and tags (without filters)" do
      token = JWT.encode({ user_id: 0, exp: 7.days.from_now.to_i }, ENV["SECRET_KEY_BASE"])
      post "/graphql", params: { query: query }, headers: { "Authorization" => "Bearer #{token}" }
      json_response = JSON.parse(response.body)
      games_response = json_response["data"]["allGames"]

      expect(games_response.count).to eq(7)
    end

    it "returns all games with 1 specific platform (Nintendo Switch)" do
      variables = {
        "platform": [platform4.name],
      }

      token = JWT.encode({ user_id: 0, exp: 7.days.from_now.to_i }, ENV["SECRET_KEY_BASE"])
      post "/graphql", params: { query: query, variables: variables }, headers: { "Authorization" => "Bearer #{token}" }
      json_response = JSON.parse(response.body)
      games_response = json_response["data"]["allGames"]

      expect(games_response.count).to eq(3)

      expect(games_response).to include(include("name" => game1.name))
      expect(games_response).to include(include("name" => game5.name))
      expect(games_response).to include(include("name" => game7.name))

      games_response.each do |game_response|
        expect(game_response["platforms"]).to include(platform4.name)
      end
    end

    it "returns all games with 2 specific genre (Action)" do
      variables = {
        "genre": [genre1.name],
      }

      token = JWT.encode({ user_id: 0, exp: 7.days.from_now.to_i }, ENV["SECRET_KEY_BASE"])
      post "/graphql", params: { query: query, variables: variables }, headers: { "Authorization" => "Bearer #{token}" }
      json_response = JSON.parse(response.body)
      games_response = json_response["data"]["allGames"]

      expect(games_response.count).to eq(6)
      expect(games_response).to include(include("name" => game1.name))
      expect(games_response).to include(include("name" => game3.name))
      expect(games_response).to include(include("name" => game4.name))
      expect(games_response).to include(include("name" => game5.name))
      expect(games_response).to include(include("name" => game6.name))
      expect(games_response).to include(include("name" => game7.name))

      games_response.each do |game_response|
        expect(game_response["genres"]).to include(genre1.name)
      end
    end

    it "returns all games with 1 specific tag (Singleplayer)" do
      variables = {
        "tag": [tag2.name],
      }

      token = JWT.encode({ user_id: 0, exp: 7.days.from_now.to_i }, ENV["SECRET_KEY_BASE"])
      post "/graphql", params: { query: query, variables: variables }, headers: { "Authorization" => "Bearer #{token}" }
      json_response = JSON.parse(response.body)
      games_response = json_response["data"]["allGames"]

      expect(games_response.count).to eq(6)
      expect(games_response).to include(include("name" => game1.name))
      expect(games_response).to include(include("name" => game3.name))
      expect(games_response).to include(include("name" => game4.name))
      expect(games_response).to include(include("name" => game5.name))
      expect(games_response).to include(include("name" => game6.name))
      expect(games_response).to include(include("name" => game7.name))

      games_response.each do |game_response|
        expect(game_response["tags"]).to include(tag2.name)
      end
    end

    it "returns 0 games with an invalid search tag" do
      variables = {
        "tag": [tag5.name],
      }

      token = JWT.encode({ user_id: 0, exp: 7.days.from_now.to_i }, ENV["SECRET_KEY_BASE"])
      post "/graphql", params: { query: query, variables: variables }, headers: { "Authorization" => "Bearer #{token}" }
      json_response = JSON.parse(response.body)
      games_response = json_response["data"]["allGames"]

      expect(games_response.count).to eq(0)
    end

    it "returns 0 games with an invalid search tag" do
      variables = {
        "tag": [tag5.name],
      }

      token = JWT.encode({ user_id: 0, exp: 7.days.from_now.to_i }, ENV["SECRET_KEY_BASE"])
      post "/graphql", params: { query: query, variables: variables }, headers: { "Authorization" => "Bearer #{token}" }
      json_response = JSON.parse(response.body)
      games_response = json_response["data"]["allGames"]

      expect(games_response.count).to eq(0)
    end

    it "returns 0 games with many filters" do
      variables = {
        "platform": [platform4.name],
        "genre": [genre1.name],
        "tag": [tag5.name],
      }

      token = JWT.encode({ user_id: 0, exp: 7.days.from_now.to_i }, ENV["SECRET_KEY_BASE"])
      post "/graphql", params: { query: query, variables: variables }, headers: { "Authorization" => "Bearer #{token}" }
      json_response = JSON.parse(response.body)
      games_response = json_response["data"]["allGames"]

      expect(games_response.count).to eq(0)
    end

    it "returns 2 game with the exact filters required" do
      variables = {
        "platform": [platform1.name, platform2.name, platform3.name],
        "genre": [genre2.name],
        "tag": [tag1.name, tag3.name],
      }

      token = JWT.encode({ user_id: 0, exp: 7.days.from_now.to_i }, ENV["SECRET_KEY_BASE"])
      post "/graphql", params: { query: query, variables: variables }, headers: { "Authorization" => "Bearer #{token}" }
      json_response = JSON.parse(response.body)
      games_response = json_response["data"]["allGames"]

      expect(games_response.count).to eq(2)
    end

    it "does not returns duplicates when the same arguments are passed multiple times" do
      variables = {
        "genre": [genre2.name, genre2.name],
      }

      token = JWT.encode({ user_id: 0, exp: 7.days.from_now.to_i }, ENV["SECRET_KEY_BASE"])
      post "/graphql", params: { query: query, variables: variables }, headers: { "Authorization" => "Bearer #{token}" }
      json_response = JSON.parse(response.body)
      games_response = json_response["data"]["allGames"]

      expect(games_response.count).to eq(2)
    end

    it "does not returns duplicates" do
      variables = {
        "genre": [genre1.name],
        "tag": [tag3.name],
      }

      token = JWT.encode({ user_id: 0, exp: 7.days.from_now.to_i }, ENV["SECRET_KEY_BASE"])
      post "/graphql", params: { query: query, variables: variables }, headers: { "Authorization" => "Bearer #{token}" }
      json_response = JSON.parse(response.body)
      games_response = json_response["data"]["allGames"]

      expect(games_response.count).to eq(6)
    end

    it "returns the correct games with multiple array filters" do
      variables = {
        "genre": [genre1.name, genre5.name],
        "tag": [tag2.name, tag3.name],
      }

      token = JWT.encode({ user_id: 0, exp: 7.days.from_now.to_i }, ENV["SECRET_KEY_BASE"])
      post "/graphql", params: { query: query, variables: variables }, headers: { "Authorization" => "Bearer #{token}" }
      json_response = JSON.parse(response.body)
      games_response = json_response["data"]["allGames"]

      expect(games_response.count).to eq(5)
    end

    it "returns the correct game by a specific year" do
      variables = {
        year: 2014,
      }

      token = JWT.encode({ user_id: 0, exp: 7.days.from_now.to_i }, ENV["SECRET_KEY_BASE"])
      post "/graphql", params: { query: query, variables: variables.to_json }, headers: { "Authorization" => "Bearer #{token}" }
      json_response = JSON.parse(response.body)
      games_response = json_response["data"]["allGames"]

      expect(games_response.count).to eq(1)
    end

    it "returns no games with an invalid year" do
      variables = {
        year: -1,
      }

      token = JWT.encode({ user_id: 0, exp: 7.days.from_now.to_i }, ENV["SECRET_KEY_BASE"])
      post "/graphql", params: { query: query, variables: variables.to_json }, headers: { "Authorization" => "Bearer #{token}" }
      json_response = JSON.parse(response.body)
      games_response = json_response["data"]["allGames"]

      expect(games_response.count).to eq(0)
    end

    it "skips invalid entries (empty strings) from the search" do
      variables = {
        "tag": [""],
      }

      token = JWT.encode({ user_id: 0, exp: 7.days.from_now.to_i }, ENV["SECRET_KEY_BASE"])
      post "/graphql", params: { query: query, variables: variables }, headers: { "Authorization" => "Bearer #{token}" }
      json_response = JSON.parse(response.body)
      games_response = json_response["data"]["allGames"]

      expect(games_response.count).to eq(7)
    end

    it "returns all games that match a specific search" do
      variables = {
        "search": "Dark Souls",
      }

      token = JWT.encode({ user_id: 0, exp: 7.days.from_now.to_i }, ENV["SECRET_KEY_BASE"])
      post "/graphql", params: { query: query, variables: variables }, headers: { "Authorization" => "Bearer #{token}" }
      json_response = JSON.parse(response.body)
      games_response = json_response["data"]["allGames"]

      expect(games_response.count).to eq(2)
    end

    it "returns all games that match a specific search (2)" do
      variables = {
        "search": "Legend",
      }

      token = JWT.encode({ user_id: 0, exp: 7.days.from_now.to_i }, ENV["SECRET_KEY_BASE"])
      post "/graphql", params: { query: query, variables: variables }, headers: { "Authorization" => "Bearer #{token}" }
      json_response = JSON.parse(response.body)
      games_response = json_response["data"]["allGames"]

      expect(games_response.count).to eq(1)
    end

    it "returns all games sorted by name" do
      variables = {
        "sortBy": "name",
      }

      token = JWT.encode({ user_id: 0, exp: 7.days.from_now.to_i }, ENV["SECRET_KEY_BASE"])
      post "/graphql", params: { query: query, variables: variables }, headers: { "Authorization" => "Bearer #{token}" }
      json_response = JSON.parse(response.body)
      games_response = json_response["data"]["allGames"]

      expect(games_response.count).to eq(7)

      expect(games_response[0]).to (include("name" => game3.name))
      expect(games_response[1]).to (include("name" => game6.name))
      expect(games_response[2]).to (include("name" => game4.name))
      expect(games_response[3]).to (include("name" => game2.name))
      expect(games_response[4]).to (include("name" => game1.name))
      expect(games_response[5]).to (include("name" => game7.name))
      expect(games_response[6]).to (include("name" => game5.name))
    end

    it "returns all games sorted by newest_releases" do
      variables = {
        "sortBy": "newest_releases",
      }

      token = JWT.encode({ user_id: 0, exp: 7.days.from_now.to_i }, ENV["SECRET_KEY_BASE"])
      post "/graphql", params: { query: query, variables: variables }, headers: { "Authorization" => "Bearer #{token}" }
      json_response = JSON.parse(response.body)
      games_response = json_response["data"]["allGames"]

      expect(games_response.count).to eq(7)

      expect(games_response[0]).to (include("name" => game7.name))
      expect(games_response[1]).to (include("name" => game4.name))
      expect(games_response[2]).to (include("name" => game5.name))
      expect(games_response[3]).to (include("name" => game6.name))
      expect(games_response[4]).to (include("name" => game1.name))
      expect(games_response[5]).to (include("name" => game2.name))
      expect(games_response[6]).to (include("name" => game3.name))
    end

    it "returns all games sorted by oldest_releases" do
      variables = {
        "sortBy": "oldest_releases",
      }

      token = JWT.encode({ user_id: 0, exp: 7.days.from_now.to_i }, ENV["SECRET_KEY_BASE"])
      post "/graphql", params: { query: query, variables: variables }, headers: { "Authorization" => "Bearer #{token}" }
      json_response = JSON.parse(response.body)
      games_response = json_response["data"]["allGames"]

      expect(games_response.count).to eq(7)

      expect(games_response[0]).to (include("name" => game3.name))
      expect(games_response[1]).to (include("name" => game2.name))
      expect(games_response[2]).to (include("name" => game1.name))
      expect(games_response[3]).to (include("name" => game6.name))
      expect(games_response[4]).to (include("name" => game5.name))
      expect(games_response[5]).to (include("name" => game4.name))
      expect(games_response[6]).to (include("name" => game7.name))
    end

    it "returns all games sorted by avg_score" do
      variables = {
        "sortBy": "avg_score",
      }

      token = JWT.encode({ user_id: 1, exp: 7.days.from_now.to_i }, ENV["SECRET_KEY_BASE"])
      post "/graphql", params: { query: query, variables: variables }, headers: { "Authorization" => "Bearer #{token}" }
      json_response = JSON.parse(response.body)
      games_response = json_response["data"]["allGames"]

      expect(games_response.count).to eq(7)

      expect(games_response[0]).to (include("name" => game5.name))
      expect(games_response[1]).to (include("name" => game6.name))
      expect(games_response[2]).to (include("name" => game4.name))
      expect(games_response[3]).to (include("name" => game7.name))
      expect(games_response[4]).to (include("name" => game2.name))
      expect(games_response[5]).to (include("name" => game1.name))
      expect(games_response[6]).to (include("name" => game3.name))
    end

    it "returns all games sorted by total_rating" do
      variables = {
        "sortBy": "total_rating",
      }

      token = JWT.encode({ user_id: 1, exp: 7.days.from_now.to_i }, ENV["SECRET_KEY_BASE"])
      post "/graphql", params: { query: query, variables: variables }, headers: { "Authorization" => "Bearer eyJhbGciOiJIUzI1NiJ9.eyJ1c2VyX2lkIjoxLCJleHAiOjE2ODg0NDEwNjR9.9oj9lSWaHDoEwqkkY3gHSVnprim-Ezu6dBeiOdprOj0" }
      json_response = JSON.parse(response.body)
      games_response = json_response["data"]["allGames"]

      expect(games_response.count).to eq(7)

      expect(games_response[0]).to (include("name" => game3.name))
      expect(games_response[1]).to (include("name" => game2.name))
      expect(games_response[2]).to (include("name" => game4.name))
      expect(games_response[3]).to (include("name" => game1.name))
      expect(games_response[4]).to (include("name" => game6.name))
      expect(games_response[5]).to (include("name" => game7.name))
      expect(games_response[6]).to (include("name" => game5.name))
    end

    it "returns all games that aren't on the Playstation 5" do
      variables = {
        "excludedPlatforms": [platform1.name],
      }

      token = JWT.encode({ user_id: 1, exp: 7.days.from_now.to_i }, ENV["SECRET_KEY_BASE"])
      post "/graphql", params: { query: query, variables: variables }, headers: { "Authorization" => "Bearer eyJhbGciOiJIUzI1NiJ9.eyJ1c2VyX2lkIjoxLCJleHAiOjE2ODg0NDEwNjR9.9oj9lSWaHDoEwqkkY3gHSVnprim-Ezu6dBeiOdprOj0" }
      json_response = JSON.parse(response.body)
      games_response = json_response["data"]["allGames"]

      expect(games_response.count).to eq(1)
      expect(games_response[0]).to (include("name" => game5.name))
    end

    it "returns all games that aren't on the Nintendo Switch" do
      variables = {
        "excludedPlatforms": [platform4.name],
      }

      token = JWT.encode({ user_id: 0, exp: 7.days.from_now.to_i }, ENV["SECRET_KEY_BASE"])
      post "/graphql", params: { query: query, variables: variables }, headers: { "Authorization" => "Bearer eyJhbGciOiJIUzI1NiJ9.eyJ1c2VyX2lkIjoxLCJleHAiOjE2ODg0NDEwNjR9.9oj9lSWaHDoEwqkkY3gHSVnprim-Ezu6dBeiOdprOj0" }
      json_response = JSON.parse(response.body)
      games_response = json_response["data"]["allGames"]

      expect(games_response.count).to eq(4)

      expect(games_response).to include(include("name" => game2.name))
      expect(games_response).to include(include("name" => game3.name))
      expect(games_response).to include(include("name" => game4.name))
      expect(games_response).to include(include("name" => game6.name))

      expect(games_response).to_not include(include("name" => game1.name))
      expect(games_response).to_not include(include("name" => game5.name))
    end

    it "returns all games that aren't on the Nintendo Switch and macOS" do
      variables = {
        "excludedPlatforms": [platform4.name, platform5.name],
      }

      token = JWT.encode({ user_id: 0, exp: 7.days.from_now.to_i }, ENV["SECRET_KEY_BASE"])
      post "/graphql", params: { query: query, variables: variables }, headers: { "Authorization" => "Bearer eyJhbGciOiJIUzI1NiJ9.eyJ1c2VyX2lkIjoxLCJleHAiOjE2ODg0NDEwNjR9.9oj9lSWaHDoEwqkkY3gHSVnprim-Ezu6dBeiOdprOj0" }
      json_response = JSON.parse(response.body)
      games_response = json_response["data"]["allGames"]

      expect(games_response.count).to eq(4)

      expect(games_response).to include(include("name" => game2.name))
      expect(games_response).to include(include("name" => game3.name))
      expect(games_response).to include(include("name" => game4.name))
      expect(games_response).to include(include("name" => game6.name))

      expect(games_response).to_not include(include("name" => game1.name))
      expect(games_response).to_not include(include("name" => game5.name))
    end

    it "returns all games that are not categorized under the action genre" do
      variables = {
        "excludedGenres": [genre1.name],
      }

      token = JWT.encode({ user_id: 1, exp: 7.days.from_now.to_i }, ENV["SECRET_KEY_BASE"])
      post "/graphql", params: { query: query, variables: variables }, headers: { "Authorization" => "Bearer eyJhbGciOiJIUzI1NiJ9.eyJ1c2VyX2lkIjoxLCJleHAiOjE2ODg0NDEwNjR9.9oj9lSWaHDoEwqkkY3gHSVnprim-Ezu6dBeiOdprOj0" }
      json_response = JSON.parse(response.body)
      games_response = json_response["data"]["allGames"]

      expect(games_response.count).to eq(1)
      expect(games_response[0]).to (include("name" => game2.name))
    end

    it "returns all games that are not categorized under the Turn-based strategy genre" do
      variables = {
        "excludedGenres": [genre3.name],
      }

      token = JWT.encode({ user_id: 0, exp: 7.days.from_now.to_i }, ENV["SECRET_KEY_BASE"])
      post "/graphql", params: { query: query, variables: variables }, headers: { "Authorization" => "Bearer eyJhbGciOiJIUzI1NiJ9.eyJ1c2VyX2lkIjoxLCJleHAiOjE2ODg0NDEwNjR9.9oj9lSWaHDoEwqkkY3gHSVnprim-Ezu6dBeiOdprOj0" }
      json_response = JSON.parse(response.body)
      games_response = json_response["data"]["allGames"]

      expect(games_response.count).to eq(6)

      expect(games_response).to include(include("name" => game2.name))
      expect(games_response).to include(include("name" => game3.name))
      expect(games_response).to include(include("name" => game4.name))
      expect(games_response).to include(include("name" => game5.name))
      expect(games_response).to include(include("name" => game6.name))

      expect(games_response).to_not include(include("name" => game1.name))
    end

    it "returns all games that are not categorized under the Sports or Turn-based strategy genre" do
      variables = {
        "excludedGenres": [genre2.name, genre3.name],
      }

      token = JWT.encode({ user_id: 0, exp: 7.days.from_now.to_i }, ENV["SECRET_KEY_BASE"])
      post "/graphql", params: { query: query, variables: variables }, headers: { "Authorization" => "Bearer eyJhbGciOiJIUzI1NiJ9.eyJ1c2VyX2lkIjoxLCJleHAiOjE2ODg0NDEwNjR9.9oj9lSWaHDoEwqkkY3gHSVnprim-Ezu6dBeiOdprOj0" }
      json_response = JSON.parse(response.body)
      games_response = json_response["data"]["allGames"]

      expect(games_response.count).to eq(4)

      expect(games_response).to include(include("name" => game3.name))
      expect(games_response).to include(include("name" => game4.name))
      expect(games_response).to include(include("name" => game5.name))
      expect(games_response).to include(include("name" => game6.name))

      expect(games_response).to_not include(include("name" => game1.name))
      expect(games_response).to_not include(include("name" => game2.name))
    end

    it "returns all games that do not have the Multiplayer tag assigned to them" do
      variables = {
        "excludedTags": [tag1.name],
      }

      token = JWT.encode({ user_id: 1, exp: 7.days.from_now.to_i }, ENV["SECRET_KEY_BASE"])
      post "/graphql", params: { query: query, variables: variables }, headers: { "Authorization" => "Bearer eyJhbGciOiJIUzI1NiJ9.eyJ1c2VyX2lkIjoxLCJleHAiOjE2ODg0NDEwNjR9.9oj9lSWaHDoEwqkkY3gHSVnprim-Ezu6dBeiOdprOj0" }
      json_response = JSON.parse(response.body)
      games_response = json_response["data"]["allGames"]

      expect(games_response.count).to eq(5)

      expect(games_response).to include(include("name" => game1.name))
      expect(games_response).to include(include("name" => game3.name))
      expect(games_response).to include(include("name" => game4.name))
      expect(games_response).to include(include("name" => game5.name))
      expect(games_response).to include(include("name" => game6.name))

      expect(games_response).to_not include(include("name" => game2.name))
      expect(games_response).to_not include(include("name" => game7.name))
    end

    it "returns all games that do not have the Fantasy tag assigned to them" do
      variables = {
        "excludedTags": [tag4.name],
      }

      token = JWT.encode({ user_id: 0, exp: 7.days.from_now.to_i }, ENV["SECRET_KEY_BASE"])
      post "/graphql", params: { query: query, variables: variables }, headers: { "Authorization" => "Bearer eyJhbGciOiJIUzI1NiJ9.eyJ1c2VyX2lkIjoxLCJleHAiOjE2ODg0NDEwNjR9.9oj9lSWaHDoEwqkkY3gHSVnprim-Ezu6dBeiOdprOj0" }
      json_response = JSON.parse(response.body)
      games_response = json_response["data"]["allGames"]

      expect(games_response.count).to eq(2)

      expect(games_response).to include(include("name" => game2.name))
      expect(games_response).to include(include("name" => game7.name))

      expect(games_response).to_not include(include("name" => game1.name))
      expect(games_response).to_not include(include("name" => game3.name))
      expect(games_response).to_not include(include("name" => game4.name))
      expect(games_response).to_not include(include("name" => game5.name))
      expect(games_response).to_not include(include("name" => game6.name))
    end

    it "returns no games with the excluded 3D tag" do
      variables = {
        "excludedTags": [tag3.name],
      }

      token = JWT.encode({ user_id: 0, exp: 7.days.from_now.to_i }, ENV["SECRET_KEY_BASE"])
      post "/graphql", params: { query: query, variables: variables }, headers: { "Authorization" => "Bearer eyJhbGciOiJIUzI1NiJ9.eyJ1c2VyX2lkIjoxLCJleHAiOjE2ODg0NDEwNjR9.9oj9lSWaHDoEwqkkY3gHSVnprim-Ezu6dBeiOdprOj0" }
      json_response = JSON.parse(response.body)
      games_response = json_response["data"]["allGames"]

      expect(games_response.count).to eq(0)
    end

    it "returns all games that are not categorized under the Sports or Turn-based strategy genre" do
      variables = {
        "excludedTags": [tag2.name, tag4.name],
      }

      token = JWT.encode({ user_id: 0, exp: 7.days.from_now.to_i }, ENV["SECRET_KEY_BASE"])
      post "/graphql", params: { query: query, variables: variables }, headers: { "Authorization" => "Bearer eyJhbGciOiJIUzI1NiJ9.eyJ1c2VyX2lkIjoxLCJleHAiOjE2ODg0NDEwNjR9.9oj9lSWaHDoEwqkkY3gHSVnprim-Ezu6dBeiOdprOj0" }
      json_response = JSON.parse(response.body)
      games_response = json_response["data"]["allGames"]

      expect(games_response.count).to eq(1)

      expect(games_response).to include(include("name" => game2.name))
    end

    def query
      <<~GQL
        query getAllGames($platform: [String!], $genre: [String!], $tag: [String!], 
        $excludedPlatforms: [String!], $excludedGenres: [String!], $excludedTags: [String!]
        $year: Int, $search: String, $sortBy: String) {
          allGames(platform: $platform, genre: $genre, tag: $tag, 
          excludedPlatforms: $excludedPlatforms, excludedGenres: $excludedGenres, excludedTags: $excludedTags, 
          year: $year, search: $search, sortBy: $sortBy) {
            name
            genres
            platforms
            tags
          }
        }
      GQL
    end
  end
end
