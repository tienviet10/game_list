require "json"

platforms_json = File.read("public/platforms.json")
platforms = JSON.parse(platforms_json)

platforms.each do |platform|
  Platform.find_or_create_by(name: platform["name"], id: platform["id"])
end

tags_json = File.read("public/themes.json")
tags = JSON.parse(tags_json)

tags.each do |tag|
  Tag.find_or_create_by(name: tag["name"], id: tag["id"])
end

genres = [
  "Fighting",
  "Shooter",
  "Music",
  "Platform",
  "Puzzle",
  "Racing",
  "Real Time Strategy (RTS)",
  "Role-playing (RPG)",
  "Simulator",
  "Sport",
  "Strategy",
  "Turn-based strategy (TBS)",
  "Tactical",
  "Quiz/Trivia",
  "Hack and slash/Beat 'em up",
  "Pinball",
  "Adventure",
  "Arcade",
  "Visual Novel",
  "Indie",
  "Card & Board Game",
  "MOBA",
  "Point-and-click",
]

genres.each do |genre|
  Genre.find_or_create_by(name: genre)
end

games_json = File.read("public/games.json")
games = JSON.parse(games_json)

games.each do |game|
  id = game["id"]
  name = game["name"]
  description = game["summary"]
  imageURL = game["cover"]
  bannerURL = game["screenshots"][0]
  releaseDate = Time.at(game["first_release_date"]).to_date.to_s
  avg_score = (game["total_rating"] / 10).round(1)
  total_rating = game["total_rating_count"]

  genres = game["genres"].map do |genre|
    Genre.find_or_create_by(name: genre)
  end

  platforms = game["platforms"].map do |platform|
    Platform.find_or_create_by(name: platform)
  end

  tags = game["themes"].map do |tag|
    Tag.find_or_create_by(name: tag)
  end

  #  Modify into url version:
  imageURL = "https:" + imageURL if imageURL.present?

  bannerURL = "https:" + bannerURL if bannerURL.present?

  game = Game.find_by(name: name)

  if game.nil?
    game = Game.create(
      name: name,
      description: description,
      imageURL: imageURL,
      bannerURL: bannerURL,
      releaseDate: releaseDate,
      avg_score: avg_score,
      total_rating: total_rating,
    )
    game.genres << genres
    game.platforms << platforms
    game.tags << tags
  end
end

# game1 = Game.first
# game2 = Game.find_by(id: "2")
# game3 = Game.find_by(id: "3")

# user1 = User.create(
#   username: "Vv",
#   email: "v@gmail.com",
#   password: "password",
#   banner_picture: "https://images.igdb.com/igdb/image/upload/t_screenshot_big/kky41w6g87pnw8omnoff.jpg",
#   user_picture: "https://avatoon.me/wp-content/uploads/2021/09/Cartoon-Pic-Ideas-for-DP-Profile-01.png",
#   bio: Faker::Lorem.paragraph(sentence_count: 2),
#   is_active: true,
#   listsOrder: "planning,playing,completed,paused,dropped,justAdded",
# )

# user2 = User.create(
#   username: "Chang",
#   email: "chang@gmail.com",
#   password: "password",
#   banner_picture: "https://images.igdb.com/igdb/image/upload/t_screenshot_big/kky41w6g87pnw8omnoff.jpg",
#   user_picture: "https://robohash.org/#{Faker::Lorem.word}.png?size=300x300&set=set1",
#   bio: Faker::Lorem.paragraph(sentence_count: 2),
#   is_active: true,
#   listsOrder: "planning,playing,completed,paused,dropped,justAdded",
# )

# user3 = User.create(
#   username: "Andrew",
#   email: "andrew@gmail.com",
#   password: "password",
#   banner_picture: "https://images.igdb.com/igdb/image/upload/t_screenshot_big/kky41w6g87pnw8omnoff.jpg",
#   user_picture: "https://robohash.org/#{Faker::Lorem.word}.png?size=300x300&set=set1",
#   bio: Faker::Lorem.paragraph(sentence_count: 2),
#   is_active: true,
#   listsOrder: "planning,playing,completed,paused,dropped,justAdded",
# )

# user4 = User.create(
#   username: "Nathan",
#   email: "nathan@example.com",
#   password: "password",
#   banner_picture: "https://images.igdb.com/igdb/image/upload/t_screenshot_big/kky41w6g87pnw8omnoff.jpg",
#   user_picture: "https://robohash.org/#{Faker::Lorem.word}.png?size=300x300&set=set1",
#   bio: Faker::Lorem.paragraph(sentence_count: 2),
#   is_active: true,
#   listsOrder: "planning,playing,completed,paused,dropped,justAdded",
# )

# user5 = User.create(
#   username: "Jenny",
#   email: "jenny@example.com",
#   password: "password",
#   banner_picture: "https://images.igdb.com/igdb/image/upload/t_screenshot_big/kky41w6g87pnw8omnoff.jpg",
#   user_picture: "https://robohash.org/#{Faker::Lorem.word}.png?size=300x300&set=set1",
#   bio: Faker::Lorem.paragraph(sentence_count: 2),
#   is_active: true,
#   listsOrder: "planning,playing,completed,paused,dropped,justAdded",
# )

# user6 = User.create(
#   username: "Megan",
#   email: "megan@example.com",
#   password: "password",
#   banner_picture: "https://images.igdb.com/igdb/image/upload/t_screenshot_big/kky41w6g87pnw8omnoff.jpg",
#   user_picture: "https://robohash.org/#{Faker::Lorem.word}.png?size=300x300&set=set1",
#   bio: Faker::Lorem.paragraph(sentence_count: 2),
#   is_active: true,
#   listsOrder: "planning,playing,completed,paused,dropped,justAdded",
# )

# 30.times do
#   User.create(
#     username: Faker::Name.name,
#     email: Faker::Internet.email,
#     password: "password",
#     banner_picture: Faker::LoremFlickr.image(size: "500x300", search_terms: ["profile"]),
#     user_picture: "https://robohash.org/#{Faker::Lorem.word}.png?size=300x300&set=set1",
#     bio: Faker::Lorem.paragraph(sentence_count: 2),
#     is_active: true,
#     listsOrder: "planning,playing,completed,paused,dropped,justAdded",
#   )
# end

# Follow.create(
#   follower_id: "1",
#   followed_id: "2",
# )

# Follow.create(
#   follower_id: "1",
#   followed_id: "3",
# )
# Follow.create(
#   follower_id: "1",
#   followed_id: "4",
# )
# Follow.create(
#   follower_id: "1",
#   followed_id: "5",
# )

# Follow.create(
#   follower_id: "14",
#   followed_id: "1",
# )

# Follow.create(
#   follower_id: "12",
#   followed_id: "1",
# )
# Follow.create(
#   follower_id: "10",
#   followed_id: "1",
# )

# user_game_1 = UserGame.create(
#   user_id: user1.id,
#   game_id: game1.id,
#   game_status: :Planning,
#   start_date: Faker::Date.between(from: "2014-09-23", to: "2021-09-25"),
#   completed_date: Faker::Date.between(from: "2014-09-23", to: "2021-09-25"),
#   private: Faker::Boolean.boolean(true_ratio: 0.5),
#   rating: Faker::Number.between(from: 1, to: 5),
#   game_note: Faker::Lorem.paragraph(sentence_count: 2),
# )

# 5.times do StatusUpdate.create(
#   user_game_id: user_game_1.id,
#   status: ["Playing", "Paused", "Dropped", "Completed", "Planning"].sample,
# ) end

# 5.times do
#   GameJournal.create(
#     user_id: user1.id,
#     game_id: game1.id,
#     content: Faker::Lorem.paragraph(sentence_count: 2),
#   )
# end

# user_game_2 = UserGame.create(
#   user_id: user1.id,
#   game_id: game2.id,
#   game_status: :Playing,
#   start_date: Faker::Date.between(from: "2014-09-23", to: "2021-09-25"),
#   completed_date: Faker::Date.between(from: "2014-09-23", to: "2021-09-25"),
#   private: Faker::Boolean.boolean(true_ratio: 0.5),
#   rating: Faker::Number.between(from: 1, to: 5),
#   game_note: Faker::Lorem.paragraph(sentence_count: 2),
# )

# 5.times do StatusUpdate.create(
#   user_game_id: user_game_2.id,
#   status: ["Playing", "Paused", "Dropped", "Completed", "Planning"].sample,
# ) end

# 5.times do
#   GameJournal.create(
#     user_id: user1.id,
#     game_id: game2.id,
#     content: Faker::Lorem.paragraph(sentence_count: 2),
#   )
# end

# user_game_3 = UserGame.create(
#   user_id: user1.id,
#   game_id: game3.id,
#   game_status: :Playing,
#   start_date: Faker::Date.between(from: "2014-09-23", to: "2021-09-25"),
#   completed_date: Faker::Date.between(from: "2014-09-23", to: "2021-09-25"),
#   private: Faker::Boolean.boolean(true_ratio: 0.5),
#   rating: Faker::Number.between(from: 1, to: 5),
#   game_note: Faker::Lorem.paragraph(sentence_count: 2),
# )

# 5.times do StatusUpdate.create(
#   user_game_id: user_game_3.id,
#   status: ["Playing", "Paused", "Dropped", "Completed", "Planning"].sample,
# ) end

# 5.times do
#   GameJournal.create(
#     user_id: user1.id,
#     game_id: game3.id,
#     content: Faker::Lorem.paragraph(sentence_count: 2),
#   )
# end

# 2.times do
#   Like.create(
#     user_id: Faker::Number.between(from: 1, to: 30),
#     likeable_id: StatusUpdate.first.id,
#     likeable_type: "StatusUpdate",
#   )
# end

# 3.times do
#   Like.create(
#     user_id: Faker::Number.between(from: 1, to: 30),
#     likeable_id: 12,
#     likeable_type: "StatusUpdate",
#   )
# end
# 4.times do
#   Like.create(
#     user_id: Faker::Number.between(from: 1, to: 30),
#     likeable_id: 10,
#     likeable_type: "StatusUpdate",
#   )
# end
# Like.create(
#   user_id: user5.id,
#   likeable_id: 8,
#   likeable_type: "StatusUpdate",
# )
# Like.create(
#   user_id: user2.id,
#   likeable_id: 6,
#   likeable_type: "StatusUpdate",
# )
