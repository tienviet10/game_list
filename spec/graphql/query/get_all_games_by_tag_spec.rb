require "rails_helper"

describe Queries::Game::GetAllGamesByTag, type: :request do
  describe "verify get all games by tag query" do
    let!(:tag1) { create(:tag, name: "Multiplayer") }
    let!(:tag2) { create(:tag, name: "Singleplayer") }
    let!(:tag3) { create(:tag, name: "Adventure") }

    let!(:game1) {
      create(:game,
             name: "Persona 5",
             description: "Inside a casino, during one of their heists, the group known as Phantom Thieves of Hearts is cornered by the police. Unable to escape, the leader of the group (the game's protagonist) is put under arrest, and goes into interrogation.",
             imageURL: "https://www.mobygames.com/game/86408/persona-5/",
             releaseDate: "2014-09-23",
             avg_score: 4.5,
             total_rating: 1000,
             tags: [tag2, tag3])
    }

    let!(:game2) {
      create(:game,
             name: "FIFA 11",
             description: "FIFA Soccer 11 is a licensed soccer game which allows the player to directly control his athletes. He has various playing modes to his disposal, e.g. single matches, multiplayer or leagues to prove his skill.",
             imageURL: "https://www.mobygames.com/game/51960/fifa-soccer-11/",
             releaseDate: "2011-09-23",
             avg_score: 4.7,
             total_rating: 2000,
             tags: [tag1, tag2])
    }

    let!(:game3) {
      create(:game,
             name: "Assassin's Creed",
             description: "Assassin's Creed is a non-linear action-adventure video game, during which the player controls a 12th-century Levantine Assassin named Ibn-La'Ahad during the Third Crusade, whose life is experienced through the Animus by his 21st century descendant, Desmond Miles.",
             imageURL: "https://www.igdb.com/games/assassin-s-creed/",
             releaseDate: "2007-09-23",
             avg_score: 4.4,
             total_rating: 3000,
             tags: [tag2, tag3])
    }

    it "returns all games assosicated with correct tag (by ID)" do
      token = JWT.encode({ user_id: 0, exp: 7.days.from_now.to_i }, Rails.application.secrets.secret_key_base)
      post "/graphql", params: { query: queryById(tag1.id) }, headers: { "Authorization" => "Bearer #{token}" }

      json_response = JSON.parse(response.body)
      games_response = json_response["data"]["getAllGamesByTag"]

      # Expect game_response to contain the game "FIFA 11"
      expect(games_response.count).to eq(1)
      expect(games_response.find { |item| item["name"] == game2.name }).to_not be_nil # "FIFA 11"

      # Expect game_response to not contain the games "Persona 5" and "Assassin's Creed"
      expect(games_response.find { |item| item["name"] == game1.name }).to be_nil # Persona 5
      expect(games_response.find { |item| item["name"] == game3.name }).to be_nil # Assassin's Creed
    end

    it "returns all games assosicated with correct tag (by Name)" do
      token = JWT.encode({ user_id: 0, exp: 7.days.from_now.to_i }, Rails.application.secrets.secret_key_base)
      post "/graphql", params: { query: queryByName(tag3.name) }, headers: { "Authorization" => "Bearer #{token}" }

      json_response = JSON.parse(response.body)
      games_response = json_response["data"]["getAllGamesByTag"]

      # Expect game_response to contain the game "Persona 5" and "Assassin's Creed"
      expect(games_response.count).to eq(2)
      expect(games_response.find { |item| item["name"] == game1.name }).to_not be_nil # Persona 5
      expect(games_response.find { |item| item["name"] == game3.name }).to_not be_nil # Assassin's Creed

      # Expect game_response to not contain the game "FIFA 11"
      expect(games_response.find { |item| item["name"] == game2.name }).to be_nil # "FIFA 11"
    end

    it "expects the response to be the same if you query by ID or name" do
      # Query by ID
      token = JWT.encode({ user_id: 0, exp: 7.days.from_now.to_i }, Rails.application.secrets.secret_key_base)
      post "/graphql", params: { query: queryById(tag1.id) }, headers: { "Authorization" => "Bearer #{token}" }

      json_responseID = JSON.parse(response.body)
      games_responseID = json_responseID["data"]["getAllGamesByTag"]

      # Query by Name
      token = JWT.encode({ user_id: 0, exp: 7.days.from_now.to_i }, Rails.application.secrets.secret_key_base)
      post "/graphql", params: { query: queryByName(tag1.name) }, headers: { "Authorization" => "Bearer #{token}" }

      json_responseName = JSON.parse(response.body)
      games_responseName = json_responseName["data"]["getAllGamesByTag"]

      # Expect the responses to be the exact same
      expect(games_responseID.count).to eq(games_responseName.count)
      expect(games_responseID).to eq(games_responseName)
    end

    def queryById(id)
      <<~GQL
        {
          getAllGamesByTag(tag: { ID: #{id} }) {
            name
          }
        }
      GQL
    end

    def queryByName(name)
      <<~GQL
        {
          getAllGamesByTag(tag: { name: "#{name}" }) {
            name
          }
        }
      GQL
    end
  end
end
