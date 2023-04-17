# require "rails_helper"
# require "factory_bot_rails"

# RSpec.describe Mutations::Users::UpdateUser do
#   describe "#resolve" do
#     let(:user) { create(:user) }

#     subject { described_class.new(object: nil, context: nil, field: nil) }

#     context "When the user is found" do
#       it "updates the user's password" do
#         result = subject.resolve(id: user.id, payload: "new_password", action: "password")
#         expect(result[:user]).to be_persisted
#         expect(result[:user].username).to eq("MyString")
#         expect(result[:user].email).to eq("MyString")
#         expect(result[:user].is_active).to eq(false)
#         expect(result[:user].password).to eq("new_password")
#         expect(result[:errors]).to be_empty
#       end
#     end

#     context "When the user is not found" do
#       it "raises an ActiveRecord::RecordNotFound error" do
#         expect { subject.resolve(id: 0, payload: "new_password", action: "password") }.to raise_error(ActiveRecord::RecordNotFound)
#       end
#     end
#   end
# end

require "rails_helper"

describe Mutations::Users::UpdateUser, type: :request do
  describe "Update User Test" do
    let!(:user) { create(:user) }

    context "when valid params are provided" do
      let(:payload) { "newpassword" }
      let(:action) { "password" }
      let(:mutation) do
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

      it "returns the updated user" do
        token = JWT.encode({ user_id: user.id, exp: 7.days.from_now.to_i }, Rails.application.secrets.secret_key_base)
        post "/graphql", params: { query: mutation }, headers: { "Authorization" => "Bearer #{token}" }
        json_response = JSON.parse(response.body)
        expect(json_response["data"]["updateUser"]["user"]["id"]).to eq(user.id.to_s)
        expect(json_response["data"]["updateUser"]["errors"]).to be_empty
      end
    end

    context "when an invalid action is provided" do
      let(:payload) { "newpassword" }
      let(:action) { "invalid_action" }
      let(:mutation) do
        <<~GQL
          mutation {
            updateUser( input: {payload: "#{payload}", action: "#{action}"}) {
              user {
                id
              }
              errors
            }
          }
        GQL
      end

      it "does not return the updated user" do
        token = JWT.encode({ user_id: user.id, exp: 7.days.from_now.to_i }, Rails.application.secrets.secret_key_base)
        post "/graphql", params: { query: mutation }, headers: { "Authorization" => "Bearer #{token}" }
        json_response = JSON.parse(response.body)
        expect(json_response["data"]["updateUser"]["user"]).to be_nil
        expect(response.body).to include("Invalid action")
      end
    end

    context "when the user cannot be found" do
      let(:payload) { "newpassword" }
      let(:action) { "password" }
      let(:mutation) do
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

      it "does not return the updated user but raise error" do
        expect { post "/graphql", params: { query: mutation }, headers: { "Authorization" => "Bearer #{ENV["AUTHORIZATION_TOKEN"]}" } }.to raise_error(ActiveRecord::RecordNotFound)
      end
    end
  end
end
