FactoryBot.define do
  factory :user_game do
    association :user, factory: :user
    association :game, factory: :game

    game_status { "Playing" }
    game_note { "MyText" }
    start_date { "2023-04-14 15:54:11" }
    completed_date { "2023-04-14 15:54:11" }
    private { false }
    rating { 1 }
    review { "MyText" }
  end
end
