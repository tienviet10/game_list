# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the bin/rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)

# 25.times do
#   user = User.create(
#     username: Faker::Name.name,
#     email: Faker::Internet.email,
#     password_digest: "password",
#     banner_picture: Faker::LoremFlickr.image(size: "500x300", search_terms: ['game']), user_picture: Faker::LoremFlickr.image(size: "300x300",
#     search_terms: ['game']),
#     bio: Faker::Lorem.paragraph(sentence_count: 2),
#     is_active: true
#     )

#   game = Game.create(
#     name: Faker::Game.title,
#     description: Faker::Lorem.paragraph(sentence_count: 2),
#     imageURL: Faker::LoremFlickr.image(size: "300x300", search_terms: ['game']),
#     releaseDate: Faker::Date.between(from: '2014-09-23', to: '2021-09-25'),
#     avg_score: Faker::Number.decimal(l_digits: 1, r_digits: 1),
#     total_rating: Faker::Number.between(from: 1, to: 100)
#   )
#   2.times do
#     game.genres.create(name: Faker::Game.genre)
#     game.platforms.create(name: Faker::Game.platform)
#     game.tags.create(name: Faker::Game.genre)
#   end

  # user_game = UserGame.create(
  # user_id: user.id,
  # game_id: game.id,
  # game_status: "Planning", game_note: Faker::Lorem.paragraph(sentence_count: 2),
  # start_date: Faker::Date.between(from: '2014-09-23', to: '2021-09-25'),
  # completed_date: Faker::Date.between(from: '2014-09-23', to: '2021-09-25'),
  # private: Faker::Boolean.boolean(true_ratio: 0.5),
  # rating: Faker::Number.between(from: 1, to: 5), review: Faker::Lorem.paragraph(sentence_count: 2)
  # )


# end
