# require "rails_helper"
# require "factory_bot_rails"

# describe Mutations::UserGames::AddUserGames do
#   describe "Add a game to user's list" do
#     let(:user) { create(:user) }
#     let(:game) { create(:game) }

#     subject { described_class.new(object: nil, context: { current_user: user }, field: nil) }

#     context "When the game is not in the user_games table" do
#       it "adds the game to the user's list" do
#         result = subject.resolve(game_id: game.id)
#         expect(result[:user_game]).to be_persisted
#         expect(result[:user_game].user_id).to eq(user.id)
#         expect(result[:user_game].game_id).to eq(game.id)
#         expect(result[:errors]).to be_empty
#       end
#     end

#     context "When the game is already in the user's list" do
#       it "returns an error" do
#         create(:user_game, user_id: user.id, game_id: game.id)
#         result = subject.resolve(game_id: game.id)
#         expect(result[:user_game]).to be_nil
#         expect(result[:errors]).to include("User Game already exists")
#       end
#     end

#     context "When user is not authenticated" do
#       let(:user) { nil }

#       it "returns an error" do
#         result = subject.resolve(game_id: game.id)
#         expect(result[:user_game]).to be_nil
#         expect(result[:errors]).to include("Authentication required")
#       end
#     end
#   end
# end
require "rails_helper"
require "factory_bot_rails"

describe Mutations::UserGames::AddUserGames, type: :request do
  describe "Add a game to user's list" do
    let!(:user) { create(:user, username: "user0", email: "user0@gmail.com", password: "password") }
    let!(:game) { create(:game, name: "Persona 5", description: "Inside a casino, during one of their heists, the group known as Phantom Thieves of Hearts is cornered by the police. Unable to escape, the leader of the group (the game's protagonist) is put under arrest, and goes into interrogation.", imageURL: "https://www.mobygames.com/game/86408/persona-5/", releaseDate: "2014-09-23", avg_score: 4.5, total_rating: 1000) }
    let!(:token) { JWT.encode({ user_id: user.id, exp: 7.days.from_now.to_i }, Rails.application.secrets.secret_key_base) }

    # subject { described_class.new(object: nil, context: nil, field: nil) }

    context "when the user is authenticated" do
      it "adds the game to the user's list" do
        post "/graphql", params: { query: mutation(game.id) }, headers: { "Authorization" => "Bearer #{token}" }

        result = JSON.parse(response.body).deep_symbolize_keys[:data][:addUserGames]

        expect(result[:userGame][:id]).to be_present
        expect(result[:userGame][:game][:id]).to eq(game.id.to_s)
        expect(result[:userGame][:game][:name]).to eq(game.name)
        expect(result[:errors]).to be_empty
      end

      it "returns an error when the game is already in the game list" do
        create(:user_game, user_id: user.id, game_id: game.id)

        post "/graphql", params: { query: mutation(game.id) }, headers: { "Authorization" => "Bearer #{token}" }

        result = JSON.parse(response.body).deep_symbolize_keys[:data][:addUserGames]

        expect(result[:userGame]).to be_nil
        expect(result[:errors]).to include("User Game already exists")
      end
    end

    context "when the user is not authenticated" do
      it "returns an error" do
        post "/graphql", params: { query: mutation(game.id) }
        result_error = JSON.parse(response.body).deep_symbolize_keys[:error]
        result_message = JSON.parse(response.body).deep_symbolize_keys[:message]

        expect(result_error).to be_present
        expect(result_message).to include("Please login again")
      end
    end

    def mutation(gameId)
      <<~GQL
        mutation  {
          addUserGames(input: {gameId: "#{gameId}"}) {
            userGame {
              id

              game {
                id
                name
              }
            }
            errors
          }
        }
      GQL
    end
  end
end
