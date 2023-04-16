require "rails_helper"
require "factory_bot_rails"

RSpec.describe Mutations::UserGames::AddUserGames do
  describe "#resolve" do
    let(:user) { create(:user) }
    let(:game) { create(:game) }

    subject { described_class.new(object: nil, context: nil, field: nil) }

    context "When the game is not in the user_games table" do
      it "adds the game to the user_games table" do
        result = subject.resolve(user_id: user.id, game_id: game.id)
        expect(result[:user_game]).to be_persisted
        expect(result[:errors]).to be_empty
      end
    end

    context "When the game is already in the user_games table" do
      it "returns an error" do
        user_game = create(:user_game, user_id: user.id, game_id: game.id)
        result = subject.resolve(user_id: user.id, game_id: game.id)
        expect(result[:user_game]).to be_nil
        expect(result[:errors]).to include("User Game already exists")
      end
    end
  end
end

