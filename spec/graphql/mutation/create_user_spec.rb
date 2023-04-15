require "rails_helper"

describe Mutations::Users::RegisterUser do
  def createAUser(username:, email:, password:)
    described_class.new(object: nil, field: nil, context: {}).resolve(
      username: username, email: email, password: password,
    )
  end

  it "creates a new user" do
    result = createAUser(
      username: "Test User",
      email: "email@example.com",
      password: "password",
    )

    user = result[:user]

    expect(user).to be_persisted
    expect(user.username).to eq("Test User")
    expect(user.email).to eq("email@example.com")
  end
end
