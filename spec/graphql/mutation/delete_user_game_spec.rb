require "rails_helper"

describe Mutations::UserGames::DeleteUserGames do
  describe "delete a game in user's list" do
    let(:user) { create(:user) }
    let(:game) { create(:game) }

    subject { described_class.new(object: nil, context: nil, field: nil) }

    context "When the game is in the user_games table" do
      it "deletes the game from the user_games table" do
        create(:user_game, user_id: user.id, game_id: game.id)
        result = subject.resolve(user_id: user.id, game_id: game.id)
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
  end
end
