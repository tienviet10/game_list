require "rails_helper"

describe Queries::Game::GenresPlatformsTags, type: :request do
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

    it "returns all genres, platforms, and tags" do
      token = JWT.encode({ user_id: 0, exp: 7.days.from_now.to_i }, Rails.application.secrets.secret_key_base)
      post "/graphql", params: { query: queryGenresPlatformsTags }, headers: { "Authorization" => "Bearer #{token}" }

      json_response = JSON.parse(response.body)
      genresPlatformsTags = json_response["data"]["getGenresPlatformsTags"]

      expect(genresPlatformsTags["genres"]).to eq(["Action", "Sports", "Turn-based strategy", "Stealth", "Role-playing"])
      expect(genresPlatformsTags["platforms"]).to eq(["PlayStation 5", "Xbox One", "Windows", "Nintendo Switch"])
      expect(genresPlatformsTags["tags"]).to eq(["Multiplayer", "Singleplayer", "3D", "Fantasy", "NO_GAMES"])
    end

    def queryGenresPlatformsTags
      <<~GQL
        {
          getGenresPlatformsTags {
            genres
            platforms
            tags
          }
        }
      GQL
    end
  end
end
