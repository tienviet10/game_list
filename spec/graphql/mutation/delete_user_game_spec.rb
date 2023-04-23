require "rails_helper"
require "factory_bot_rails"

describe Mutations::UserGames::DeleteUserGames, type: :request do
  describe "delete a game in user's list" do
    let!(:user) { create(:user, username: "user0", email: "user0@gmail.com", password: "password") }
    let!(:game) { create(:game, name: "Persona 5", description: "Inside a casino, during one of their heists, the group known as Phantom Thieves of Hearts is cornered by the police. Unable to escape, the leader of the group (the game's protagonist) is put under arrest, and goes into interrogation.", imageURL: "https://www.mobygames.com/game/86408/persona-5/", releaseDate: "2014-09-23", avg_score: 4.5, total_rating: 1000) }
    let!(:token) { JWT.encode({ user_id: user.id, exp: 7.days.from_now.to_i }, Rails.application.secrets.secret_key_base) }

    context "When the game is in the user_games table" do
      it "deletes the game from the user_games table" do
        post "/graphql", params: { query: mutation(game.id) }, headers: { "Authorization" => "Bearer #{token}" }
        create(:user_game, user_id: user.id, game_id: game.id)
        result = JSON.parse(response.body).deep_symbolize_keys[:data][:deleteUserGames]
        expect(result[:user_game]).to be_destroyed

        expect(result[:errors]).to be_empty
      end
    end

    context "When the game is not in the user_games table" do
      it "returns an error" do
        result = subject.resolve(user_id: user.id, game_id: game.id)
        expect(result[:user_game]).to be_nil
        expect(result[:errors]).to include("User Game not found")
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
