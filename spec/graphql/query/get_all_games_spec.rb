require "rails_helper"

describe Queries::Game::GetAllGames, type: :request do
  describe "verify get all games query" do
    let!(:game1) { create(:game, name: "Persona 5", description: "Inside a casino, during one of their heists, the group known as Phantom Thieves of Hearts is cornered by the police. Unable to escape, the leader of the group (the game's protagonist) is put under arrest, and goes into interrogation.", imageURL: "https://www.mobygames.com/game/86408/persona-5/", bannerURL: "https://images.igdb.com/igdb/image/upload/t_screenshot_big/gin55k9eyfq8udk0taym.jpg", releaseDate: "2014-09-23", avg_score: 4.5, total_rating: 1000) }
    let!(:game2) { create(:game, name: "FIFA 11", description: "FIFA Soccer 11 is a licensed soccer game which allows the player to directly control his athletes. He has various playing modes to his disposal, e.g. single matches, multiplayer or leagues to prove his skill.", imageURL: "https://www.mobygames.com/game/51960/fifa-soccer-11/", bannerURL: "https://images.igdb.com/igdb/image/upload/t_screenshot_big/gin55k9eyfq8udk0taym.jpg", releaseDate: "2011-09-23", avg_score: 4.7, total_rating: 2000) }
    let!(:game3) { create(:game, name: "Assassin's Creed", description: "Assassin's Creed is a non-linear action-adventure video game, during which the player controls a 12th-century Levantine Assassin named Ibn-La'Ahad during the Third Crusade, whose life is experienced through the Animus by his 21st century descendant, Desmond Miles.", imageURL: "https://www.igdb.com/games/assassin-s-creed/", bannerURL: "https://images.igdb.com/igdb/image/upload/t_screenshot_big/gin55k9eyfq8udk0taym.jpg", releaseDate: "2007-09-23", avg_score: 4.4, total_rating: 3000) }
    let!(:genre1) { create(:genre, name: "action") }
    let!(:genre2) { create(:genre, name: "sport") }
    let!(:tag1) { create(:tag, name: "multiplayers") }
    let!(:tag2) { create(:tag, name: "singleplayer") }
    let!(:platform1) { create(:platform, name: "PS5") }
    let!(:platform2) { create(:platform, name: "XBox") }

    it "returns all games with their genres, platforms, and tags" do
      game1.genres << genre1
      game1.tags << tag1
      game1.platforms << platform1
      game2.genres << genre2
      game2.tags << tag2
      game2.platforms << platform2
      game3.genres << genre1
      game3.tags << tag2
      game3.platforms << platform1

      token = JWT.encode({ user_id: 0, exp: 7.days.from_now.to_i }, Rails.application.secrets.secret_key_base)
      post "/graphql", params: { query: query }, headers: { "Authorization" => "Bearer #{token}" }
      json_response = JSON.parse(response.body)
      games_response = json_response["data"]["allGames"]

      expect(games_response.count).to eq(3)
      games_response.each do |game_response|
        game = game1
        if game_response["name"] == "FIFA 11"
          game = game2
        end
        if game_response["name"] == "Assassin's Creed"
          game = game3
        end
        expect(game_response["genres"][0]).to eq(game.genres.first.name)
        expect(game_response["platforms"][0]).to eq(game.platforms.first.name)
        expect(game_response["tags"][0]).to eq(game.tags.first.name)
      end
    end

    def query
      <<~GQL
        {
          allGames {
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
