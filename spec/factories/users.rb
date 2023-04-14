FactoryBot.define do
  factory :user do
    username { "MyString" }
    email { "MyString" }
    password_digest { "MyString" }
    banner_picture { "MyString" }
    user_picture { "MyString" }
    bio { "MyString" }
    is_active { false }
  end
end
