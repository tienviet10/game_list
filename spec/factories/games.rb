FactoryBot.define do
  factory :game do
    name { "MyString" }
    description { "MyText" }
    imageURL { "MyText" }
    releaseDate { "2023-04-14 15:42:52" }
    avg_score { "9.99" }
    total_rating { 1 }
  end
end
