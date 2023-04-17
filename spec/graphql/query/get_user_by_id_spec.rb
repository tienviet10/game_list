require "rails_helper"

describe Queries::User::GetUserById, type: :request do
  describe "Get user by ID Test" do
    let!(:user) { create(:user) }

    it "When the user is found" do
      token = JWT.encode({ user_id: user.id, exp: 7.days.from_now.to_i }, Rails.application.secrets.secret_key_base)
      post "/graphql", params: { query: query }, headers: { "Authorization" => "Bearer #{token}" }
      json_response = JSON.parse(response.body)
      expect(json_response["data"]["getUserById"]["username"]).to eq(user.username)
    end

    it "When the user is not found" do
      token = JWT.encode({ user_id: 0, exp: 7.days.from_now.to_i }, Rails.application.secrets.secret_key_base)
      post "/graphql", params: { query: query }, headers: { "Authorization" => "Bearer #{token}" }
      json_response = JSON.parse(response.body)
      expect(json_response["errors"][0]["message"]).to eq("User not found")
    end

    def query
      <<~GQL
        {
          getUserById {
            username
          }
        }
      GQL
    end
  end

  # describe "Get user by ID Test" do
  #   let!(:user) { create(:user) }

  #   subject { described_class.new(object: nil, context: nil, field: nil) }

  #   context "When the user is found" do
  #     it "returns the user" do
  #       result = subject.resolve()
  #       expect(result).to eq(user)
  #     end
  #   end

  #   context "When the user is not found" do
  #     it "raises an ActiveRecord::RecordNotFound error" do
  #       expect { subject.resolve() }.to raise_error(ActiveRecord::RecordNotFound)
  #     end
  #   end
  # end
end
