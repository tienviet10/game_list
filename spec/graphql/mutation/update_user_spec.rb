require "rails_helper"
require "factory_bot_rails"

RSpec.describe Mutations::Users::UpdateUser do
  describe "#resolve" do
    let(:user) { create(:user) }

    subject { described_class.new(object: nil, context: nil, field: nil) }

    context "When the user is found" do
      it "updates the user's password" do
        result = subject.resolve(id: user.id, payload: "new_password", action: "password")
        expect(result[:user]).to be_persisted
        expect(result[:user].username).to eq("MyString")
        expect(result[:user].email).to eq("MyString")
        expect(result[:user].is_active).to eq(false)
        expect(result[:user].password).to eq("new_password")
        expect(result[:errors]).to be_empty
      end
    end

    context "When the user is not found" do
      it "raises an ActiveRecord::RecordNotFound error" do
        expect { subject.resolve(id: 0, payload: "new_password", action: "password") }.to raise_error(ActiveRecord::RecordNotFound)
      end
    end
  end
end


