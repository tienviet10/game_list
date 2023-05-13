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
  "Role-playing",
  "Turn-based strategy",
]

platforms = [
  "Xbox",
  "Xbox 360",
  "Xbox One",
  "Xbox Series X",
  "PlayStation",
  "PlayStation 2",
  "PlayStation 3",
  "PlayStation 4",
  "PlayStation 5",
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

["Indie", "Singleplayer", "Adventure", "Action", "2D", "3D", "Puzzle", "Fantasy", "Soullike", "Zombies", "Dungeons & Dragons", "Multiplayer", "Simulator"].each do |tag|
  Tag.create(name: tag)
end

platforms.each do |platform|
  Platform.create(name: platform)
end

Game.create(
  name: "Dead Space",
  description: "The sci-fi survival horror classic Dead Space returns, completely rebuilt from the ground up by Motive Studios to offer a deeper and more immersive experience. Harnessing the power of the Frostbite game engine and next generation consoles, this remake brings jaw-dropping visual fidelity and improvements to gameplay while staying true to the original.",
  imageURL: "https://images.igdb.com/igdb/image/upload/t_cover_big/co5esn.png",
  bannerURL: "https://images.igdb.com/igdb/image/upload/t_screenshot_big/sckeer.jpg",
  releaseDate: "2023-01-27",
  avg_score: 8.3,
  total_rating: 100,
  genres: [Genre.find_by(name: "Action"), Genre.find_by(name: "Adventure"), Genre.find_by(name: "Survival horror")],
  tags: [Tag.find_by(name: "Singleplayer"), Tag.find_by(name: "Adventure"), Tag.find_by(name: "Action"), Tag.find_by(name: "3D"), Tag.find_by(name: "Fantasy")],
  platforms: [Platform.find_by(name: "Xbox One"), Platform.find_by(name: "PlayStation 4"), Platform.find_by(name: "Windows")],
)

Game.create(
  name: "Persona 5",
  description: "Inside a casino, during one of their heists, the group known as Phantom Thieves of Hearts is cornered by the police. Unable to escape, the leader of the group (the game's protagonist) is put under arrest, and goes into interrogation.",
  imageURL: "https://images.igdb.com/igdb/image/upload/t_cover_big/co1r76.png",
  bannerURL: "https://images.igdb.com/igdb/image/upload/t_screenshot_big/gin55k9eyfq8udk0taym.jpg", releaseDate: "2014-09-23", avg_score: 4.5, total_rating: 1000,
  genres: [Genre.find_by(name: "Action"), Genre.find_by(name: "Adventure"), Genre.find_by(name: "Music")],
  tags: [Tag.find_by(name: "Singleplayer"), Tag.find_by(name: "Adventure"), Tag.find_by(name: "Action"), Tag.find_by(name: "3D"), Tag.find_by(name: "Fantasy")],
  platforms: [Platform.find_by(name: "Xbox One"), Platform.find_by(name: "PlayStation 4"), Platform.find_by(name: "Windows")],
)

Game.create(
  name: "Dark Souls: Remastered",
  description: "Then, there was fire. Re-experience the critically acclaimed, genre-defining game that started it all. Beautifully remastered, return to Lordran in stunning high-definition detail running at 60fps. Dark Souls Remastered includes the main game plus the Artorias of the Abyss DLC.",
  imageURL: "https://images.igdb.com/igdb/image/upload/t_cover_big/co2uro.png",
  bannerURL: "https://images.igdb.com/igdb/image/upload/t_screenshot_big/zqpwusikqtoeawmsdaqd.jpg",
  releaseDate: "2018-05-25",
  avg_score: 8.0,
  total_rating: 1000,
  genres: [Genre.find_by(name: "Role-playing"), Genre.find_by(name: "Adventure")],
  tags: [Tag.find_by(name: "Singleplayer"), Tag.find_by(name: "Adventure"), Tag.find_by(name: "Action"), Tag.find_by(name: "3D"), Tag.find_by(name: "Soullike")],
  platforms: [Platform.find_by(name: "Xbox One"), Platform.find_by(name: "PlayStation 4"), Platform.find_by(name: "Windows")],
)

Game.create(
  name: "The Legend of Zelda: Breath of the Wild",
  description: "Forget everything you know about The Legend of Zelda games. Step into a world of discovery, exploration and adventure in The Legend of Zelda: Breath of the Wild, a boundary-breaking new game in the acclaimed series.",
  imageURL: "https://images.igdb.com/igdb/image/upload/t_cover_big/co3p2d.png",
  bannerURL: "https://images.igdb.com/igdb/image/upload/t_screenshot_big/sckj6g.jpg",
  releaseDate: "2017-03-03",
  avg_score: 9.5,
  total_rating: 1000,
  genres: [Genre.find_by(name: "Adventure"), Genre.find_by(name: "Role-playing")],
  tags: [Tag.find_by(name: "Singleplayer"), Tag.find_by(name: "Action"), Tag.find_by(name: "Fantasy")],
  platforms: [Platform.find_by(name: "Nintendo Switch"), Platform.find_by(name: "Wii U")],
)

Game.create(
  name: "The Last of Us Part II",
  description: "Five years after their dangerous journey across the post-pandemic United States, Ellie and Joel have settled down in Jackson, Wyoming. Living amongst a thriving community of survivors has allowed them peace and stability, despite the constant threat of the infected and other, more desperate survivors.",
  imageURL: "https://images.igdb.com/igdb/image/upload/t_cover_big/co5ziw.png",
  bannerURL: "https://images.igdb.com/igdb/image/upload/t_screenshot_big/rdonk4uvyh8ijanrbs46.jpg",
  releaseDate: "2020-06-19",
  avg_score: 9.2,
  total_rating: 1000,
  genres: [Genre.find_by(name: "Adventure"), Genre.find_by(name: "Third-person shooter")],
  tags: [Tag.find_by(name: "Singleplayer"), Tag.find_by(name: "Action"), Tag.find_by(name: "Zombies")],
  platforms: [Platform.find_by(name: "PlayStation 4")],
)

Game.create(
  name: "Dark Souls II Scholar of the First Sin",
  description: "Dark Souls II: Scholar of the First Sin is the complete Dark Souls II experience, adding to the 2014's critically acclaimed title, Dark Souls II not only its three DLC chapters; Crown Of The Sunken King, Crown Of The Old Iron King, and Crown Of The Ivory King but as well an array of all-new content.",
  imageURL: "https://images.igdb.com/igdb/image/upload/t_cover_big/co20um.png",
  bannerURL: "https://images.igdb.com/igdb/image/upload/t_screenshot_big/g8roegct3qyzmnubhoeb.jpg",
  releaseDate: "2015-04-02",
  avg_score: 8.0,
  total_rating: 1000,
  genres: [Genre.find_by(name: "Role-playing"), Genre.find_by(name: "Adventure")],
  tags: [Tag.find_by(name: "Singleplayer"), Tag.find_by(name: "Adventure"), Tag.find_by(name: "Action"), Tag.find_by(name: "3D"), Tag.find_by(name: "Soullike")],
  platforms: [Platform.find_by(name: "Xbox One"), Platform.find_by(name: "PlayStation 4"), Platform.find_by(name: "Windows")],
)

Game.create(
  name: "Might & Magic: Heroes VI",
  description: "The adventure in Heroes VI, starting 400 years before events in Heroes V, catapults a family of heroes into a fast-paced epic story where Angels plot to end -- once and for all -- an unfinished war with their ancient rivals, the Faceless.",
  imageURL: "https://images.igdb.com/igdb/image/upload/t_cover_big/co2ss4.png",
  bannerURL: "https://images.igdb.com/igdb/image/upload/t_screenshot_big/eg2qhyzo5s0js7zmirly.jpg",
  releaseDate: "2011-10-13",
  avg_score: 7.0,
  total_rating: 1000,
  genres: [Genre.find_by(name: "Turn-based strategy")],
  tags: [Tag.find_by(name: "Singleplayer"), Tag.find_by(name: "Multiplayer"), Tag.find_by(name: "Fantasy")],
  platforms: [Platform.find_by(name: "Windows")],
)

Game.create(
  name: "The Elder Scrolls V: Skyrim",
  description: "The next chapter in the highly anticipated Elder Scrolls saga arrives from the makers of the 2006 and 2008 Games of the Year, Bethesda Game Studios. Skyrim reimagines and revolutionizes the open-world fantasy epic, bringing to life a complete virtual world open for you to explore any way you choose.",
  imageURL: "https://images.igdb.com/igdb/image/upload/t_cover_big/co1tnw.png",
  bannerURL: "https://images.igdb.com/igdb/image/upload/t_screenshot_big/urqw7ltwmhr39gkidsih.jpg",
  releaseDate: "2011-10-13",
  avg_score: 9.0,
  total_rating: 1000,
  genres: [Genre.find_by(name: "Role-playing"), Genre.find_by(name: "Turn-based strategy")],
  tags: [Tag.find_by(name: "Singleplayer"), Tag.find_by(name: "Multiplayer"), Tag.find_by(name: "Adventure"), Tag.find_by(name: "Fantasy")],
  platforms: [Platform.find_by(name: "Windows")],
)

Game.create(
  name: "The Elder Scrolls IV: Oblivion",
  description: "The Elder Scrolls IV: Oblivion is an action role-playing video game developed by Bethesda Game Studios and published by Bethesda Softworks and the Take-Two Interactive division 2K Games. It is the fourth installment in The Elder Scrolls action fantasy series, following The Elder Scrolls III: Morrowind and preceding The Elder Scrolls V: Skyrim.",
  imageURL: "https://images.igdb.com/igdb/image/upload/t_cover_big/co1tc8.png",
  bannerURL: "https://images.igdb.com/igdb/image/upload/t_screenshot_big/qkxismtaqjwpkcxr3ip0.jpg",
  releaseDate: "2006-03-20",
  avg_score: 9.0,
  total_rating: 1000,
  genres: [Genre.find_by(name: "Role-playing"), Genre.find_by(name: "Turn-based strategy")],
  tags: [Tag.find_by(name: "Singleplayer"), Tag.find_by(name: "Multiplayer"), Tag.find_by(name: "Adventure"), Tag.find_by(name: "Fantasy")],
  platforms: [Platform.find_by(name: "Windows")],
)

Game.create(
  name: "Neverwinter Nights 2",
  description: "Neverwinter Nights 2 is a role-playing video game developed by Obsidian Entertainment and published by Atari, Inc. It is the sequel to BioWare's Neverwinter Nights, based on the Dungeons & Dragons pencil and paper fantasy role-playing game. Neverwinter Nights 2 utilizes an adaptation of the Dungeons & Dragons 3.5 edition rules.",
  imageURL: "https://images.igdb.com/igdb/image/upload/t_cover_big/co1syd.png",
  bannerURL: "https://images.igdb.com/igdb/image/upload/t_screenshot_big/kduz5wyvyqxp5e9ydcru.jpg",
  releaseDate: "2006-10-31",
  avg_score: 8.0,
  total_rating: 1000,
  genres: [Genre.find_by(name: "Role-playing"), Genre.find_by(name: "Turn-based strategy")],
  tags: [Tag.find_by(name: "Singleplayer"), Tag.find_by(name: "Adventure"), Tag.find_by(name: "Dungeons & Dragons")],
  platforms: [Platform.find_by(name: "Windows")],
)

Game.create(
  name: "Dead Island 2",
  description: "Several months after the events on Banoi, California is put under full quarantine, becoming a bloody paradise and an action-packed playground for renegades who seek adventure and glory.",
  imageURL: "https://images.igdb.com/igdb/image/upload/t_cover_big/co5469.png",
  bannerURL: "https://images.igdb.com/igdb/image/upload/t_screenshot_big/scii5w.jpg",
  releaseDate: "2023-04-21",
  avg_score: 7.0,
  total_rating: 1000,
  genres: [Genre.find_by(name: "Role-playing"), Genre.find_by(name: "Turn-based strategy")],
  tags: [Tag.find_by(name: "Singleplayer"), Tag.find_by(name: "Multiplayer"), Tag.find_by(name: "Zombies"), Tag.find_by(name: "Fantasy")],
  platforms: [Platform.find_by(name: "PlayStation 5"), Platform.find_by(name: "Xbox Series X")],
)

Game.create(
  name: "Terra Nil",
  description: "A reverse city builder where you use resources to restore the planet's barren wasteland into a lush green world filled with thriving flora and fauna. Recover precious natural resources and rebuild the planet bit by bit.",
  imageURL: "https://images.igdb.com/igdb/image/upload/t_cover_big/co66nn.png",
  bannerURL: "https://images.igdb.com/igdb/image/upload/t_screenshot_big/sclu8u.jpg",
  releaseDate: "2023-03-28",
  avg_score: 8.0,
  total_rating: 1000,
  genres: [Genre.find_by(name: "Role-playing"), Genre.find_by(name: "Turn-based strategy")],
  tags: [Tag.find_by(name: "Singleplayer"), Tag.find_by(name: "Simulator"), Tag.find_by(name: "Fantasy")],
  platforms: [Platform.find_by(name: "Windows")],
)

Game.create(
  name: "Planescape: Torment",
  description: "Planescape: Torment is a role-playing video game developed by Black Isle Studios and published by Interplay Entertainment. Released for Microsoft Windows on December 12, 1999, the game takes place in locations from the multiverse of Planescape, a Dungeons & Dragons (D&D) fantasy campaign setting.",
  imageURL: "https://images.igdb.com/igdb/image/upload/t_cover_big/co3ggb.png",
  bannerURL: "https://images.igdb.com/igdb/image/upload/t_screenshot_big/kb4xmak8dnz1ar5wetb9.jpg",
  releaseDate: "1999-12-12",
  avg_score: 9.0,
  total_rating: 1000,
  genres: [Genre.find_by(name: "Role-playing"), Genre.find_by(name: "Turn-based strategy")],
  tags: [Tag.find_by(name: "Singleplayer"), Tag.find_by(name: "Adventure"), Tag.find_by(name: "Dungeons & Dragons")],
  platforms: [Platform.find_by(name: "Windows"), Platform.find_by(name: "macOS")],
)

25.times do
  user = User.create(
    username: Faker::Name.name,
    email: Faker::Internet.email,
    password: "password",
    banner_picture: Faker::LoremFlickr.image(size: "500x300",
                                             search_terms: ["game"]),
    user_picture: Faker::LoremFlickr.image(size: "300x300",
                                           search_terms: ["game"]),
    bio: Faker::Lorem.paragraph(sentence_count: 2),
    is_active: true,
    listsOrder: "planning,playing,completed,paused,dropped",
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
    game_status: :Planning,
    game_note: Faker::Lorem.paragraph(sentence_count: 2),
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
  banner_picture: Faker::LoremFlickr.image(size: "500x300", search_terms: ["game"]),
  user_picture: Faker::LoremFlickr.image(size: "300x300", search_terms: ["game"]),
  bio: Faker::Lorem.paragraph(sentence_count: 2),
  is_active: true,
  listsOrder: "planning,playing,completed,paused,dropped",
)

game1 = Game.create(
  name: Faker::Game.title,
  description: Faker::Lorem.paragraph(sentence_count: 2),
  imageURL: "https://images.igdb.com/igdb/image/upload/t_cover_big/co5esn.png",
  bannerURL: "https://images.igdb.com/igdb/image/upload/t_screenshot_big/sckeer.jpg",
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
  game_status: :Planning,
  game_note: Faker::Lorem.paragraph(sentence_count: 2),
  start_date: Faker::Date.between(from: "2014-09-23", to: "2021-09-25"),
  completed_date: Faker::Date.between(from: "2014-09-23", to: "2021-09-25"),
  private: Faker::Boolean.boolean(true_ratio: 0.5),
  rating: Faker::Number.between(from: 1, to: 5),
  review: Faker::Lorem.paragraph(sentence_count: 2),
)

game2 = Game.create(
  name: "Halo 2",
  description: Faker::Lorem.paragraph(sentence_count: 2),
  imageURL: "https://images.igdb.com/igdb/image/upload/t_cover_big/co1r76.png",
  bannerURL: "https://images.igdb.com/igdb/image/upload/t_screenshot_big/gin55k9eyfq8udk0taym.jpg",
  releaseDate: Faker::Date.between(from: "2014-09-23", to: "2021-09-25"),
  avg_score: Faker::Number.decimal(l_digits: 1, r_digits: 1),
  total_rating: Faker::Number.between(from: 1, to: 100),
)
2.times do
  game2.genres << Genre.all.sample
  game2.tags << Tag.all.sample
  game2.platforms << Platform.all.sample
end

UserGame.create(
  user_id: user1.id,
  game_id: game2.id,
  game_status: :Playing,
  game_note: Faker::Lorem.paragraph(sentence_count: 2),
  start_date: Faker::Date.between(from: "2014-09-23", to: "2021-09-25"),
  completed_date: Faker::Date.between(from: "2014-09-23", to: "2021-09-25"),
  private: Faker::Boolean.boolean(true_ratio: 0.5),
  rating: Faker::Number.between(from: 1, to: 5),
  review: Faker::Lorem.paragraph(sentence_count: 2),
)

game3 = Game.create(
  name: "Halo 3",
  description: Faker::Lorem.paragraph(sentence_count: 2),
  imageURL: "https://images.igdb.com/igdb/image/upload/t_cover_big/co3p2d.png",
  bannerURL: "https://images.igdb.com/igdb/image/upload/t_screenshot_big/sckj6g.jpg",
  releaseDate: Faker::Date.between(from: "2014-09-23", to: "2021-09-25"),
  avg_score: Faker::Number.decimal(l_digits: 1, r_digits: 1),
  total_rating: Faker::Number.between(from: 1, to: 100),
)
2.times do
  game3.genres << Genre.all.sample
  game3.tags << Tag.all.sample
  game3.platforms << Platform.all.sample
end

UserGame.create(
  user_id: user1.id,
  game_id: game3.id,
  game_status: :Playing,
  game_note: Faker::Lorem.paragraph(sentence_count: 2),
  start_date: Faker::Date.between(from: "2014-09-23", to: "2021-09-25"),
  completed_date: Faker::Date.between(from: "2014-09-23", to: "2021-09-25"),
  private: Faker::Boolean.boolean(true_ratio: 0.5),
  rating: Faker::Number.between(from: 1, to: 5),
  review: Faker::Lorem.paragraph(sentence_count: 2),
)
