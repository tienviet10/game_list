require "rails_helper"

describe Mutations::Users::LoginUser do
  let!(:user) { create(:user, username: "Test User", email: "email@example.com", password: "password") }

  def loginUser(email:, password:)
    described_class.new(object: nil, field: nil, context: {}).resolve(
      email: email, password: password,
    )
  end

  it "creates a new user" do
    result = loginUser(
      email: "email@example.com",
      password: "password",
    )

    user = result[:user]

    expect(user).to be_persisted
    expect(user.username).to eq("Test User")
    expect(user.email).to eq("email@example.com")
  end
end
