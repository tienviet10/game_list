require "rails_helper"

describe Queries::UserGames::GamesByStatusForAUser, type: :request do
  describe "games by status query for a user" do
    let!(:user) { create(:user, username: "v", email: "v@gmail.com", password: "password") }

    let!(:platform1) { create(:platform, name: "PS5") }
    let!(:platform2) { create(:platform, name: "Switch") }
    let!(:platform3) { create(:platform, name: "Xbox") }

    let!(:game1) {
      create(:game,
             name: "Persona 5",
             description: "Inside a casino, during one of their heists, the group known as Phantom Thieves of Hearts is cornered by the police. Unable to escape, the leader of the group (the game's protagonist) is put under arrest, and goes into interrogation.",
             imageURL: "https://www.mobygames.com/game/86408/persona-5/",
             bannerURL: "https://images.igdb.com/igdb/image/upload/t_screenshot_big/gin55k9eyfq8udk0taym.jpg",
             releaseDate: "2014-09-23",
             avg_score: 4.5,
             total_rating: 1000,
             platforms: [platform1, platform3])
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
             platforms: [platform2])
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
             platforms: [platform3])
    }

    let!(:userGame1) {
      create(:user_game, user: user, game: game1, game_status: "Planning")
    }
    let!(:userGame2) {
      create(:user_game, user: user, game: game2, game_status: "Planning")
    }
    let!(:userGame3) {
      create(:user_game, user: user, game: game3, game_status: "Playing")
    }

    it "returns all games according to status for a user" do
      token = JWT.encode({ user_id: user.id, exp: 7.days.from_now.to_i }, Rails.application.secrets.secret_key_base)
      post "/graphql", params: { query: queryByStatus }, headers: { "Authorization" => "Bearer #{token}" }

      json_response = JSON.parse(response.body)
      expect(json_response["data"]["gamesByStatusForAUser"]).to eq({ "playing" => [{ "id" => game3.id.to_s, "name" => "Assassin's Creed", "imageURL" => "https://www.igdb.com/games/assassin-s-creed/", "avgScore" => 4.4, "platforms" => ["Xbox"] }], "planning" => [{ "id" => game1.id.to_s, "name" => "Persona 5", "imageURL" => "https://www.mobygames.com/game/86408/persona-5/", "avgScore" => 4.5, "platforms" => ["PS5", "Xbox"] }, { "id" => game2.id.to_s, "name" => "FIFA 11", "imageURL" => "https://www.mobygames.com/game/51960/fifa-soccer-11/", "avgScore" => 4.7, "platforms" => ["Switch"] }], "completed" => [], "paused" => [], "dropped" => [] })
    end

    def queryByStatus
      <<~GQL
        {
          gamesByStatusForAUser{
            playing {
              id
              name
              imageURL
              avgScore
              platforms
            } 
            planning {
              id
              name
              imageURL
              avgScore
              platforms
            }
            completed {
              id
              name
              imageURL
              avgScore
              platforms
            }
            paused {
              id
              name
              imageURL
              avgScore
              platforms
            }
            dropped {
              id
              name
              imageURL
              avgScore
              platforms
            }
          }
        }
      GQL
    end
  end
end
