require "rails_helper"
require "factory_bot_rails"

RSpec.describe Queries::User::GetUserById do
  describe "Get user by ID Test" do
    let(:user) { create(:user) }

    subject { described_class.new(object: nil, context: nil, field: nil) }

    context "When the user is found" do
      it "returns the user" do
        result = subject.resolve(id: user.id)
        expect(result).to eq(user)
      end
    end

    context "When the user is not found" do
      it "raises an ActiveRecord::RecordNotFound error" do
        expect { subject.resolve(id: 0) }.to raise_error(ActiveRecord::RecordNotFound)
      end
    end
  end
end
