FactoryBot.define do
  factory :user_game do
    user { nil }
    game { nil }
    game_status { "MyString" }
    game_note { "MyText" }
    start_date { "2023-04-14 15:54:11" }
    completed_date { "2023-04-14 15:54:11" }
    private { false }
    rating { 1 }
    review { "MyText" }
  end
end
