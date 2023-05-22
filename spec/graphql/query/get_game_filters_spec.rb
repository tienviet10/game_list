require "rails_helper"

describe Queries::Game::GetGameFilters, type: :request do
  RSpec.configure do |config|
    config.before do
      tes = "test"
    end
  end

  describe "verify get genres, platforms, and tags" do
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

    it "returns all genres, platforms, tags, and the current year" do
      token = JWT.encode({ user_id: 0, exp: 7.days.from_now.to_i }, Rails.application.secrets.secret_key_base)
      post "/graphql", params: { query: getGameFilters }, headers: { "Authorization" => "Bearer #{token}" }

      json_response = JSON.parse(response.body)
      getGameFilters = json_response["data"]["getGameFilters"]

      expect(getGameFilters["genres"]).to eq(["Action", "Sports", "Turn-based strategy", "Stealth", "Role-playing"])
      expect(getGameFilters["platforms"]).to eq(["PlayStation 5", "Xbox One", "Windows", "Nintendo Switch"])
      expect(getGameFilters["tags"]).to eq(["Multiplayer", "Singleplayer", "3D", "Fantasy", "NO_GAMES"])
      expect(getGameFilters["year"]).to eq(Date.current.year)
    end
  end

  describe "verify get genres, platforms, and tags" do
    let!(:game1) {
      create(:game,
             name: "Persona 5",
             description: "Inside a casino, during one of their heists, the group known as Phantom Thieves of Hearts is cornered by the police. Unable to escape, the leader of the group (the game's protagonist) is put under arrest, and goes into interrogation.",
             imageURL: "https://www.mobygames.com/game/86408/persona-5/",
             bannerURL: "https://images.igdb.com/igdb/image/upload/t_screenshot_big/gin55k9eyfq8udk0taym.jpg",
             releaseDate: "2014-09-23",
             avg_score: 4.5,
             total_rating: 1000,
             genres: [],
             tags: [],
             platforms: [])
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
             genres: [],
             tags: [],
             platforms: [])
    }

    it "returns the year of the furthest year", :create_games do
      token = JWT.encode({ user_id: 0, exp: 7.days.from_now.to_i }, Rails.application.secrets.secret_key_base)
      post "/graphql", params: { query: getGameFilters }, headers: { "Authorization" => "Bearer #{token}" }

      json_response = JSON.parse(response.body)
      getGameFilters = json_response["data"]["getGameFilters"]

      expect(getGameFilters["year"]).to eq(2014)
    end
  end

  def getGameFilters
    <<~GQL
      {
        getGameFilters {
          genres
          platforms
          tags
          year
        }
      }
    GQL
  end
end
