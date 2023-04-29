require "rails_helper"
require "factory_bot_rails"

describe Mutations::UserGames::DeleteUserGames, type: :request do
  describe "delete a game in user's list" do
    let!(:user) { create(:user, username: "user0", email: "user0@gmail.com", password: "password") }
    let!(:game) { create(:game, name: "Persona 5", description: "Inside a casino, during one of their heists, the group known as Phantom Thieves of Hearts is cornered by the police. Unable to escape, the leader of the group (the game's protagonist) is put under arrest, and goes into interrogation.", imageURL: "https://www.mobygames.com/game/86408/persona-5/", releaseDate: "2014-09-23", avg_score: 4.5, total_rating: 1000) }
    let!(:game2) { create(:game, name: "FIFA 11", description: "FIFA Soccer 11 is a licensed soccer game which allows the player to directly control his athletes. He has various playing modes to his disposal, e.g. single matches, multiplayer or leagues to prove his skill.", imageURL: "https://www.mobygames.com/game/51960/fifa-soccer-11/", releaseDate: "2011-09-23", avg_score: 4.7, total_rating: 2000) }
    let!(:token) { JWT.encode({ user_id: user.id, exp: 7.days.from_now.to_i }, Rails.application.secrets.secret_key_base) }
    let!(:user_game) { create(:user_game, user: user, game: game) }

    context "When the game is in the user_games table" do
      it "deletes the game from the user_games table" do
        post "/graphql", params: { query: mutation(game.id) }, headers: { "Authorization" => "Bearer #{token}" }

        result = JSON.parse(response.body).deep_symbolize_keys[:data][:deleteUserGames]

        expect(result[:userGame][:id]).to eq(user_game.id.to_s)
        expect(result[:userGame][:game][:id]).to eq(game.id.to_s)
        expect(result[:errors]).to be_empty
      end
    end

    context "When the game is not in the user_games table" do
      it "returns an error" do
        post "/graphql", params: { query: mutation(game2.id) }, headers: { "Authorization" => "Bearer #{token}" }

        result = JSON.parse(response.body).deep_symbolize_keys[:data][:deleteUserGames]

        expect(result[:user_game]).to be_nil
        expect(result[:errors]).to include("User Game not found")
      end
    end

    def mutation(gameId)
      <<~GQL
        mutation  {
          deleteUserGames(input: {gameId: "#{gameId}"}) {
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
