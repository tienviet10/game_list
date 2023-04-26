# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the bin/rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)

# 15.times do
#   genre = Genre.create(name: Faker::Game.genre)
#   tag = Tag.create(name: Faker::Game.genre)
#   platform = Platform.create(name: Faker::Game.platform)
# end

genres = [
  "First-person shooter",
  "Puzzle",
  "Platformer",
  "Action",
  "Adventure",
  "Action role-playing",
  "Dungeon crawl",
  "Roguelike",
  "Tactical role-playing",
  "Sports",
  "Simulation",
  "Fighting",
  "Massively multiplayer online",
  "Stealth",
  "Survival",
  "Rhythm",
  "Survival horror",
  "Text adventure",
  "Visual novel",
  "Real-time strategy",
  "Multiplayer online battle arena",
  "Tower defense",
  "Trivia",
  "Real-time tactics",
  "Hack and slash",
  "Battle royale",
  "Third-person shooter",
  "Music",
]

platforms = [
  "Xbox",
  "Xbox 360",
  "Xbox One",
  "PlayStation",
  "PlayStation 2",
  "PlayStation 3",
  "PlayStation 4",
  "PlayStation Portable",
  "PlayStation Vita",
  "Game Boy",
  "Game Boy Color",
  "Game Boy Advance",
  "Nintendo DS",
  "Nintendo DSi",
  "Nintendo 3DS",
  "Nintendo Entertainment System",
  "Super Nintendo Entertainment System",
  "Nintendo 64",
  "GameCube",
  "Wii",
  "Wii U",
  "Nintendo Switch",
  "Windows",
  "macOS",
  "Linux",
  "Sega Genesis",
  "Sega Master System",
  "Game Gear",
  "Sega Saturn",
  "Sega Dreamcast",
  "Virtual Boy",
]

genres.each do |genre|
  Genre.create(name: genre)
end

["Indie", "Singleplayer", "Adventure", "Action", "2D", "3D", "Puzzle", "Fantasy"].each do |tag|
  Tag.create(name: tag)
end

platforms.each do |platform|
  Platform.create(name: platform)
end

25.times do
  user = User.create(
    username: Faker::Name.name,
    email: Faker::Internet.email,
    password: "password",
    banner_picture: Faker::LoremFlickr.image(size: "500x300", search_terms: ["game"]), user_picture: Faker::LoremFlickr.image(size: "300x300",
                                                                                                                              search_terms: ["game"]),
    bio: Faker::Lorem.paragraph(sentence_count: 2),
    is_active: true,
  )

  game = Game.create(
    name: Faker::Game.title,
    description: Faker::Lorem.paragraph(sentence_count: 2),
    imageURL: Faker::LoremFlickr.image(size: "300x300", search_terms: ["game"]),
    releaseDate: Faker::Date.between(from: "2014-09-23", to: "2021-09-25"),
    avg_score: Faker::Number.decimal(l_digits: 1, r_digits: 1),
    total_rating: Faker::Number.between(from: 1, to: 100),
  )
  2.times do
    game.genres << Genre.all.sample
    game.tags << Tag.all.sample
    game.platforms << Platform.all.sample
  end

  user_game = UserGame.create(
    user_id: user.id,
    game_id: game.id,
    game_status: "Planning", game_note: Faker::Lorem.paragraph(sentence_count: 2),
    start_date: Faker::Date.between(from: "2014-09-23", to: "2021-09-25"),
    completed_date: Faker::Date.between(from: "2014-09-23", to: "2021-09-25"),
    private: Faker::Boolean.boolean(true_ratio: 0.5),
    rating: Faker::Number.between(from: 1, to: 5), review: Faker::Lorem.paragraph(sentence_count: 2),
  )
end

user1 = User.create(
  username: "Vv",
  email: "v@gmail.com",
  password: "password",
  banner_picture: Faker::LoremFlickr.image(size: "500x300", search_terms: ["game"]), user_picture: Faker::LoremFlickr.image(size: "300x300",
                                                                                                                            search_terms: ["game"]),
  bio: Faker::Lorem.paragraph(sentence_count: 2),
  is_active: true,
)

game1 = Game.create(
  name: Faker::Game.title,
  description: Faker::Lorem.paragraph(sentence_count: 2),
  imageURL: Faker::LoremFlickr.image(size: "300x300", search_terms: ["game"]),
  releaseDate: Faker::Date.between(from: "2014-09-23", to: "2021-09-25"),
  avg_score: Faker::Number.decimal(l_digits: 1, r_digits: 1),
  total_rating: Faker::Number.between(from: 1, to: 100),
)
2.times do
  game1.genres << Genre.all.sample
  game1.tags << Tag.all.sample
  game1.platforms << Platform.all.sample
end

UserGame.create(
  user_id: user1.id,
  game_id: game1.id,
  game_status: "Planning",
  game_note: Faker::Lorem.paragraph(sentence_count: 2),
  start_date: Faker::Date.between(from: "2014-09-23", to: "2021-09-25"),
  completed_date: Faker::Date.between(from: "2014-09-23", to: "2021-09-25"),
  private: Faker::Boolean.boolean(true_ratio: 0.5),
  rating: Faker::Number.between(from: 1, to: 5),
  review: Faker::Lorem.paragraph(sentence_count: 2),
)
