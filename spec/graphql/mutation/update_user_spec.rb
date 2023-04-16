require "rails_helper"
require "rails_factory_bot"

describe Mutations::Users::UpdateUser do
  def updateAUser(id:, payload:, action:)
    described_class.new(object: nil, field: nil, context: {}).resolve(
      id: id, payload: payload, action: action,
    )
  end

  it "updates a user" do
    user = User.create(
      username: "Test User",
      email: "email@example.com",
      password: "password",
      is_active: true,
    )

    result = updateAUser(
      id: user.id,
      payload: "new password",
      action: "password",
    )

    user = result[:user]

    expect(user).to be_persisted
    expect(user.password).to eq("new password")
    expect(user.email).to eq("email@example.com")
    expect(user.username).to eq("Test User")
    expect(user.is_active).to eq(true)
  end
end


