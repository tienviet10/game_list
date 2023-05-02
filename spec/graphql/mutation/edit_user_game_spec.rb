require "rails_helper"

RSpec.describe Mutations::UserGames::EditUserGames, type: :request do
  describe "#resolve" do
    let(:user) { create(:user) }
    let(:game) { create(:game) }
    let!(:user_game) { create(:user_game, user: user, game: game) }
    let(:mutation) do
      <<~GQL
        mutation {
          editUserGames(input: {
            gameId: "#{game.id}"
            gameStatus: "Playing"
            rating: 8
            gameNote: "This was a fun game!"
            review: "I really enjoyed playing this game."
            private: false
          }) {
            userGame {
              id
              gameStatus
              rating
              gameNote
              review
              private
            }
            errors
          }
        }
      GQL
    end

    let!(:token) { JWT.encode({ user_id: user.id, exp: 7.days.from_now.to_i }, Rails.application.secrets.secret_key_base) }

    context "when user is not authenticated" do
      before { post "/graphql", params: { query: mutation } }

      it "returns an error" do
        result_error = JSON.parse(response.body).deep_symbolize_keys[:error]
        result_message = JSON.parse(response.body).deep_symbolize_keys[:message]

        expect(result_error).to be_present
        expect(result_message).to include("Please login again")
      end
    end

    context "when user game does not exist" do
      let(:invalid_game_id) { 999 }

      before do
        post "/graphql", params: { query: mutation.gsub(game.id.to_s, invalid_game_id.to_s) }, headers: { "Authorization" => "Bearer #{token}" }
      end

      it "returns an error" do
        result = JSON.parse(response.body).deep_symbolize_keys[:data][:editUserGames]

        expect(result[:userGame]).to be_nil
        expect(result[:errors]).to include("User Game not found")
      end
    end

    context "when user is authenticated and user game exists" do
      before do
        post "/graphql", params: { query: mutation }, headers: { "Authorization" => "Bearer #{token}" }
      end

      it "updates and returns the user game" do
        result = JSON.parse(response.body).deep_symbolize_keys[:data][:editUserGames]

        expect(result[:userGame][:id]).to eq(user_game.id.to_s)
        expect(result[:userGame][:gameStatus]).to eq("Playing")
        expect(result[:userGame][:rating]).to eq(8)
        expect(result[:userGame][:gameNote]).to eq("This was a fun game!")
        expect(result[:userGame][:review]).to eq("I really enjoyed playing this game.")
        expect(result[:userGame][:private]).to eq(false)
        expect(result[:errors]).to be_empty
      end

      it "not update user game if game status is not valid enum type" do
        mutation = <<~GQL
          mutation {
            editUserGames(input: {
              gameId: "#{game.id}"
              gameStatus: "Invalid"
            }) {
              userGame {
                id
                gameStatus
              }
              errors
            }
          }
        GQL

        post "/graphql", params: { query: mutation }, headers: { "Authorization" => "Bearer #{token}" }

        result = JSON.parse(response.body).deep_symbolize_keys[:data][:editUserGames]

        expect(result[:userGame]).to be_nil

        expect(result[:errors]).to include("'Invalid' is not a valid game_status")
      end
    end
  end
end
