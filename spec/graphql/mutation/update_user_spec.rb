require "rails_helper"

describe Mutations::Users::UpdateUser, type: :request do
  describe "Update User Test" do
    let!(:user) { create(:user) }
    let(:token) { JWT.encode({ user_id: user.id, exp: 7.days.from_now.to_i }, Rails.application.secrets.secret_key_base) }
    let(:payload) { "newpassword" }

    context "when valid params are provided" do
      let(:action) { "password" }

      it "returns the updated user" do
        post "/graphql", params: { query: mutation(payload, action) }, headers: { "Authorization" => "Bearer #{token}" }
        json_response = JSON.parse(response.body)
        expect(json_response["data"]["updateUser"]["user"]["id"]).to eq(user.id.to_s)
        expect(json_response["data"]["updateUser"]["errors"]).to be_empty
      end
    end

    context "when an invalid action is provided" do
      let(:action) { "invalid_action" }

      it "does not return the updated user" do
        post "/graphql", params: { query: mutation(payload, action) }, headers: { "Authorization" => "Bearer #{token}" }
        json_response = JSON.parse(response.body)
        expect(json_response["data"]["updateUser"]["user"]).to be_nil
        expect(response.body).to include("Invalid action")
      end
    end

    context "when the user cannot be found" do
      let(:action) { "password" }

      it "does not return the updated user but raise error" do
        token = JWT.encode({ user_id: 0, exp: 7.days.from_now.to_i }, Rails.application.secrets.secret_key_base)
        expect { post "/graphql", params: { query: mutation(payload, action) }, headers: { "Authorization" => "Bearer #{token}" } }.to raise_error(ActiveRecord::RecordNotFound)
      end
    end

    def mutation(payload, action)
      <<~GQL
        mutation {
          updateUser(input: {payload: "#{payload}", action: "#{action}"}) {
            user {
              id
            }
            errors
          }
        }
      GQL
    end
  end
end
