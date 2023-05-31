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

game1 = Game.create(
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

game2 = Game.create(
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

game3 = Game.create(
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

Game.create(
  name: "Resident Evil 4",
  description: "Resident Evil 4 is a remake of the 2005 original Resident Evil 4 reimagined for 2023 to bring state-of-the-art survival horror. Resident Evil 4 preserves the essence of the original game, while introducing modernized gameplay, a reimagined storyline,
  and vividly detailed graphics to make this the latest survival horror game where life and death, terror and catharsis intersect.",
  imageURL: "https://images.igdb.com/igdb/image/upload/t_cover_big/co6bo0.png",
  bannerURL: "https://images.igdb.com/igdb/image/upload/t_screenshot_big/scixzc.jpg",
  releaseDate: "2020-01-27",
  avg_score: 8.8,
  total_rating: 200,
  genres: [Genre.find_by(name: "Action"), Genre.find_by(name: "Adventure"), Genre.find_by(name: "Survival horror")],
  tags: [Tag.find_by(name: "Singleplayer"), Tag.find_by(name: "Adventure"), Tag.find_by(name: "Action"), Tag.find_by(name: "3D"), Tag.find_by(name: "Fantasy")],
  platforms: [Platform.find_by(name: "Xbox One"), Platform.find_by(name: "PlayStation 4"), Platform.find_by(name: "Windows")],
)

Game.create(
  name: "Rusted Moss",
  description: "Traverse the perilous lands of a dying world in this bullet-hell inspired metroidvania! Strong enemies emerge from distant lands as the iron inventions of men succumb to the decay of rust and time. Use a trusty grappling hook and uncover new powers to battle monstrous machines, powerful witches, and explore a new emerging world.",
  imageURL: "https://images.igdb.com/igdb/image/upload/t_cover_big/co6bv5.png",
  bannerURL: "https://images.igdb.com/igdb/image/upload/t_screenshot_big/scery3.jpg",
  releaseDate: "2013-09-23",
  avg_score: 5.5,
  total_rating: 1300,
  genres: [Genre.find_by(name: "Action"), Genre.find_by(name: "Adventure"), Genre.find_by(name: "Music")],
  tags: [Tag.find_by(name: "Singleplayer"), Tag.find_by(name: "Adventure"), Tag.find_by(name: "Action"), Tag.find_by(name: "3D"), Tag.find_by(name: "Fantasy")],
  platforms: [Platform.find_by(name: "Xbox One"), Platform.find_by(name: "PlayStation 4"), Platform.find_by(name: "Windows")],
)

Game.create(
  name: "Pineapple on pizza",
  description: "Pineapple on pizza is a short game about exploring an island full of dancing people, finding a way to ruin the party, and unexpectedly enjoying it.",
  imageURL: "https://images.igdb.com/igdb/image/upload/t_cover_big/co69au.png",
  bannerURL: "https://images.igdb.com/igdb/image/upload/t_screenshot_big/sclsut.jpg",
  releaseDate: "2017-08-25",
  avg_score: 7.0,
  total_rating: 500,
  genres: [Genre.find_by(name: "Role-playing"), Genre.find_by(name: "Adventure")],
  tags: [Tag.find_by(name: "Singleplayer"), Tag.find_by(name: "Adventure"), Tag.find_by(name: "Action"), Tag.find_by(name: "3D"), Tag.find_by(name: "Soullike")],
  platforms: [Platform.find_by(name: "Xbox One"), Platform.find_by(name: "PlayStation 4"), Platform.find_by(name: "Windows")],
)

Game.create(
  name: "LEGO 2K Drive",
  description: "Welcome to Bricklandia, home of a massive open-world LEGO driving adventure. Race anywhere, play with anyone, build your dream rides, and defeat a cast of wild racing rivals for the coveted Sky Trophy! In LEGO 2K Drive, your awesome transforming vehicle gives you the freedom to speed seamlessly across riveting racetracks, off-road terrain, and open waters. Explore the vast world of Bricklandia, show off your driving skills, and build vehicles brick-by-brick!",
  imageURL: "https://images.igdb.com/igdb/image/upload/t_cover_big/co6ajx.png",
  bannerURL: "https://images.igdb.com/igdb/image/upload/t_screenshot_big/sclsfi.jpg",
  releaseDate: "2023-03-03",
  avg_score: 9.2,
  total_rating: 10,
  genres: [Genre.find_by(name: "Adventure"), Genre.find_by(name: "Role-playing")],
  tags: [Tag.find_by(name: "Singleplayer"), Tag.find_by(name: "Action"), Tag.find_by(name: "Fantasy")],
  platforms: [Platform.find_by(name: "Nintendo Switch"), Platform.find_by(name: "Wii U")],
)

Game.create(
  name: "Warhammer 40,000: Boltgun",
  description: "Load up your Boltgun and unleash the awesome Space Marine arsenal to blast your way through an explosion of sprites, pixels and blood in a perfect blend of Warhammer 40,000, frenetic gameplay and the stylish visuals of 90's retro shooters.",
  imageURL: "https://images.igdb.com/igdb/image/upload/t_cover_big/co4taa.png",
  bannerURL: "https://images.igdb.com/igdb/image/upload/t_screenshot_big/sch75h.jpg",
  releaseDate: "2020-09-25",
  avg_score: 6.2,
  total_rating: 100,
  genres: [Genre.find_by(name: "Adventure"), Genre.find_by(name: "Third-person shooter")],
  tags: [Tag.find_by(name: "Singleplayer"), Tag.find_by(name: "Action"), Tag.find_by(name: "Zombies")],
  platforms: [Platform.find_by(name: "PlayStation 4")],
)

Game.create(
  name: "Skull and Bones",
  description: "Enter the Golden Age of Piracy as you sail through rich merchant trade routes. Embody an insatiable pirate captain, dive into the battle for the ruling of the Indian Ocean and become the most feared pirate, alone or with your gang of up to 5 players.",
  imageURL: "https://images.igdb.com/igdb/image/upload/t_cover_big/co4yl7.png",
  bannerURL: "https://images.igdb.com/igdb/image/upload/t_screenshot_big/skl24txjdq6p9ele30ci.jpg",
  releaseDate: "2012-02-02",
  avg_score: 7.0,
  total_rating: 800,
  genres: [Genre.find_by(name: "Role-playing"), Genre.find_by(name: "Adventure")],
  tags: [Tag.find_by(name: "Singleplayer"), Tag.find_by(name: "Adventure"), Tag.find_by(name: "Action"), Tag.find_by(name: "3D"), Tag.find_by(name: "Soullike")],
  platforms: [Platform.find_by(name: "Xbox One"), Platform.find_by(name: "PlayStation 4"), Platform.find_by(name: "Windows")],
)

Game.create(
  name: "Hollow Knight: Silksong",
  description: "Explore a vast, haunted kingdom in Hollow Knight: Silksong, the sequel to the award winning action-adventure! Discover enchanting secrets and face foes in lethal, acrobatic combat as you ascend to the peak of a land ruled by silk and song.",
  imageURL: "https://images.igdb.com/igdb/image/upload/t_cover_big/co3vtl.png",
  bannerURL: "https://images.igdb.com/igdb/image/upload/t_screenshot_big/sc63aa.jpg",
  releaseDate: "2023-05-13",
  avg_score: 7.3,
  total_rating: 2000,
  genres: [Genre.find_by(name: "Turn-based strategy")],
  tags: [Tag.find_by(name: "Singleplayer"), Tag.find_by(name: "Multiplayer"), Tag.find_by(name: "Fantasy")],
  platforms: [Platform.find_by(name: "Windows")],
)

Game.create(
  name: "System Shock",
  description: "After 22 years, cyberpunk cult classic System Shock is getting an update. A reimagined version of the 1994 Windows PC game is in the works at Night Dive Studios for PC and Xbox One, and it's a project that company founder Stephen Kick says he can hardly believe is really happening.",
  imageURL: "https://images.igdb.com/igdb/image/upload/t_cover_big/co1ik8.png",
  bannerURL: "https://images.igdb.com/igdb/image/upload/t_screenshot_big/schdyv.jpg",
  releaseDate: "2023-01-13",
  avg_score: 3.0,
  total_rating: 200,
  genres: [Genre.find_by(name: "Role-playing"), Genre.find_by(name: "Turn-based strategy")],
  tags: [Tag.find_by(name: "Singleplayer"), Tag.find_by(name: "Multiplayer"), Tag.find_by(name: "Adventure"), Tag.find_by(name: "Fantasy")],
  platforms: [Platform.find_by(name: "Windows")],
)

Game.create(
  name: "In the Valley of Gods",
  description: "In the Valley of Gods is a single-player first person video game set in Egypt in the 1920s. You play as an explorer and filmmaker who, along with your old partner, has traveled to the middle of the desert in the hopes of making a seemingly-impossible discovery and an incredible film.",
  imageURL: "https://images.igdb.com/igdb/image/upload/t_cover_big/co2eyk.png",
  bannerURL: "https://images.igdb.com/igdb/image/upload/t_screenshot_big/vnojjpfo6moqftk4fedk.jpg",
  releaseDate: "2016-10-20",
  avg_score: 5.0,
  total_rating: 1000,
  genres: [Genre.find_by(name: "Role-playing"), Genre.find_by(name: "Turn-based strategy")],
  tags: [Tag.find_by(name: "Singleplayer"), Tag.find_by(name: "Multiplayer"), Tag.find_by(name: "Adventure"), Tag.find_by(name: "Fantasy")],
  platforms: [Platform.find_by(name: "Windows")],
)

Game.create(
  name: "Blooming Business: Casino",
  description: "Blooming Business: Casino is a business tycoon sim with a narrative twist. Build and run your own fantasy casino in a bustling world full of animals, drama and danger.",
  imageURL: "https://images.igdb.com/igdb/image/upload/t_cover_big/co54sy.png",
  bannerURL: "https://images.igdb.com/igdb/image/upload/t_screenshot_big/sccra3.jpg",
  releaseDate: "2019-10-02",
  avg_score: 8.0,
  total_rating: 1000,
  genres: [Genre.find_by(name: "Role-playing"), Genre.find_by(name: "Turn-based strategy")],
  tags: [Tag.find_by(name: "Singleplayer"), Tag.find_by(name: "Adventure"), Tag.find_by(name: "Dungeons & Dragons")],
  platforms: [Platform.find_by(name: "Windows")],
)

Game.create(
  name: "Planet Zoo",
  description: "Build a world for wildlife in Planet Zoo. From the creators of Planet Coaster and Zoo Tycoon comes the ultimate zoo sim. Construct detailed habitats, manage your zoo, and meet authentic living animals who think, feel and explore the world you create around them.",
  imageURL: "https://images.igdb.com/igdb/image/upload/t_cover_big/co1kxq.png",
  bannerURL: "https://images.igdb.com/igdb/image/upload/t_screenshot_big/sc6ev5.jpg",
  releaseDate: "2022-04-21",
  avg_score: 8.0,
  total_rating: 5000,
  genres: [Genre.find_by(name: "Role-playing"), Genre.find_by(name: "Turn-based strategy")],
  tags: [Tag.find_by(name: "Singleplayer"), Tag.find_by(name: "Multiplayer"), Tag.find_by(name: "Zombies"), Tag.find_by(name: "Fantasy")],
  platforms: [Platform.find_by(name: "PlayStation 5"), Platform.find_by(name: "Xbox Series X")],
)

Game.create(
  name: "Rise of Industry",
  description: "Rise of Industry is a strategic tycoon game that puts you in the shoes of an early 20th-century industrialist. Build and manage your growing empire in a living, breathing, and procedurally generated world that is constantly evolving and adapting to your playstyle.",
  imageURL: "https://images.igdb.com/igdb/image/upload/t_cover_big/co1rge.png",
  bannerURL: "https://images.igdb.com/igdb/image/upload/t_screenshot_big/ecpa5ddbyjoapoizvyox.jpg",
  releaseDate: "2023-03-28",
  avg_score: 7.0,
  total_rating: 2000,
  genres: [Genre.find_by(name: "Role-playing"), Genre.find_by(name: "Turn-based strategy")],
  tags: [Tag.find_by(name: "Singleplayer"), Tag.find_by(name: "Simulator"), Tag.find_by(name: "Fantasy")],
  platforms: [Platform.find_by(name: "Windows")],
)

Game.create(
  name: "Murtop",
  description: "Murtop is fast-paced arcade game packed with action, as if it was taken out directly from the 80's. Do you have enough coins to beat it?",
  imageURL: "https://images.igdb.com/igdb/image/upload/t_cover_big/co61jt.png",
  bannerURL: "https://images.igdb.com/igdb/image/upload/t_screenshot_big/scknri.jpg",
  releaseDate: "1999-12-12",
  avg_score: 8.0,
  total_rating: 1000,
  genres: [Genre.find_by(name: "Role-playing"), Genre.find_by(name: "Turn-based strategy")],
  tags: [Tag.find_by(name: "Singleplayer"), Tag.find_by(name: "Adventure"), Tag.find_by(name: "Dungeons & Dragons")],
  platforms: [Platform.find_by(name: "Windows"), Platform.find_by(name: "macOS")],
)

Game.create(
  name: "Planet Alpha",
  description: "Planet Alpha is an adventure set in a living alien world where you have the ability to manipulate the daytime.",
  imageURL: "https://images.igdb.com/igdb/image/upload/t_cover_big/co1r66.png",
  bannerURL: "https://images.igdb.com/igdb/image/upload/t_screenshot_big/qfqrfdbah622k8yfqdxb.jpg",
  releaseDate: "2019-01-27",
  avg_score: 6.8,
  total_rating: 2050,
  genres: [Genre.find_by(name: "Action"), Genre.find_by(name: "Adventure"), Genre.find_by(name: "Survival horror")],
  tags: [Tag.find_by(name: "Singleplayer"), Tag.find_by(name: "Adventure"), Tag.find_by(name: "Action"), Tag.find_by(name: "3D"), Tag.find_by(name: "Fantasy")],
  platforms: [Platform.find_by(name: "Xbox One"), Platform.find_by(name: "PlayStation 4"), Platform.find_by(name: "Windows")],
)

Game.create(
  name: "Pepper Grinder",
  description: "Pepper Grinder is an action platformer designed to be alot like oldschool Nintendo titles like Donkey Kong Country, Yoshi's Island, and Super Mario World. Pepper uses her drill (Grinder, obviously) to plow through layers of soft dirt and launch herself into the air as she maneuvers herself across the landscape of each level.",
  imageURL: "https://images.igdb.com/igdb/image/upload/t_cover_big/co6bv5.png",
  bannerURL: "https://images.igdb.com/igdb/image/upload/t_screenshot_big/sc5qv5.jpg",
  releaseDate: "2011-09-23",
  avg_score: 5.5,
  total_rating: 1300,
  genres: [Genre.find_by(name: "Action"), Genre.find_by(name: "Adventure"), Genre.find_by(name: "Music")],
  tags: [Tag.find_by(name: "Singleplayer"), Tag.find_by(name: "Adventure"), Tag.find_by(name: "Action"), Tag.find_by(name: "3D"), Tag.find_by(name: "Fantasy")],
  platforms: [Platform.find_by(name: "Xbox One"), Platform.find_by(name: "PlayStation 4"), Platform.find_by(name: "Windows")],
)

Game.create(
  name: "Degrees of Separation",
  description: "Degrees of Separation is a puzzle platformer where cooperation is built into every move. Two contrasting souls, Ember and Rime, fall in love, but are separated by an enigmatic force, and must use their powers to progress through a spectacular world of fantasy and adventure. Players solve environmental obstacles by drawing upon the contrasting temperatures of warm and cold in single-player and cooperative multiplayer.",
  imageURL: "https://images.igdb.com/igdb/image/upload/t_cover_big/co1rhd.png",
  bannerURL: "https://images.igdb.com/igdb/image/upload/t_screenshot_big/sc5il2.jpg",
  releaseDate: "2018-05-25",
  avg_score: 7.0,
  total_rating: 500,
  genres: [Genre.find_by(name: "Role-playing"), Genre.find_by(name: "Adventure")],
  tags: [Tag.find_by(name: "Singleplayer"), Tag.find_by(name: "Adventure"), Tag.find_by(name: "Action"), Tag.find_by(name: "3D"), Tag.find_by(name: "Soullike")],
  platforms: [Platform.find_by(name: "Xbox One"), Platform.find_by(name: "PlayStation 4"), Platform.find_by(name: "Windows")],
)

Game.create(
  name: "Bramble: The Mountain King",
  description: "Bramble: The Mountain King is a grim adventure set in a world inspired by dark, Nordic fables.",
  imageURL: "https://images.igdb.com/igdb/image/upload/t_cover_big/co6f01.png",
  bannerURL: "https://images.igdb.com/igdb/image/upload/t_screenshot_big/scagol.jpg",
  releaseDate: "2023-05-15",
  avg_score: 7.1,
  total_rating: 700,
  genres: [Genre.find_by(name: "Role-playing"), Genre.find_by(name: "Adventure")],
  tags: [Tag.find_by(name: "Singleplayer"), Tag.find_by(name: "Adventure"), Tag.find_by(name: "Action"), Tag.find_by(name: "3D"), Tag.find_by(name: "Soullike")],
  platforms: [Platform.find_by(name: "Xbox One"), Platform.find_by(name: "PlayStation 4"), Platform.find_by(name: "Windows")],
)

Game.create(
  name: "Dredge",
  description: "Dredge is a fishing adventure with a sinister undercurrent. Sell your catch, upgrade your vessel and dredge the depths for long-buried relics. Explore the stories of the strange locals and discover why some things are best left forgotten.",
  imageURL: "https://images.igdb.com/igdb/image/upload/t_cover_big/co69zw.png",
  bannerURL: "https://images.igdb.com/igdb/image/upload/t_screenshot_big/sccp17.jpg",
  releaseDate: "2023-05-15",
  avg_score: 7.7,
  total_rating: 900,
  genres: [Genre.find_by(name: "Role-playing"), Genre.find_by(name: "Adventure")],
  tags: [Tag.find_by(name: "Singleplayer"), Tag.find_by(name: "Adventure"), Tag.find_by(name: "Action"), Tag.find_by(name: "3D"), Tag.find_by(name: "Soullike")],
  platforms: [Platform.find_by(name: "Xbox One"), Platform.find_by(name: "PlayStation 4"), Platform.find_by(name: "Windows")],
)

Game.create(
  name: "The Murder of Sonic the Hedgehog",
  description: "A brand new Sonic experience from the minds of the Sonic Social team: The Murder of Sonic the Hedgehog is a visual novel, point-and-click adventure! It's Amy Rose's birthday and she's hosting a murder mystery party on the Mirage Express. When Sonic becomes the game's victim, everyone is off to get to the bottom of things. However, something feels a bit off - is this really an innocent game or something more sinister afoot?",
  imageURL: "https://images.igdb.com/igdb/image/upload/t_cover_big/co6bk4.png",
  bannerURL: "https://images.igdb.com/igdb/image/upload/t_screenshot_big/sclv7u.jpg",
  releaseDate: "2020-05-15",
  avg_score: 7.7,
  total_rating: 50,
  genres: [Genre.find_by(name: "Role-playing"), Genre.find_by(name: "Adventure")],
  tags: [Tag.find_by(name: "Singleplayer"), Tag.find_by(name: "Adventure"), Tag.find_by(name: "Action"), Tag.find_by(name: "3D"), Tag.find_by(name: "Soullike")],
  platforms: [Platform.find_by(name: "Xbox One"), Platform.find_by(name: "PlayStation 4"), Platform.find_by(name: "Windows")],
)

Game.create(
  name: "Octopath Traveler II",
  description: "This game is a brand-new entry in the Octopath Traveler series. It takes the series' HD-2D graphics, a fusion of retro pixel art and 3DCG, to even greater heights.
  In the world of Solistia, eight new travelers venture forth into an exciting new era.
  Where will you go? What will you do? Whose tale will you bring to life?
  Every path is yours to take. Embark on an adventure all your own.",
  imageURL: "https://images.igdb.com/igdb/image/upload/t_cover_big/co684z.png",
  bannerURL: "https://images.igdb.com/igdb/image/upload/t_screenshot_big/scix0e.jpg",
  releaseDate: "2014-09-23",
  avg_score: 6.5,
  total_rating: 900,
  genres: [Genre.find_by(name: "Action"), Genre.find_by(name: "Adventure"), Genre.find_by(name: "Music")],
  tags: [Tag.find_by(name: "Singleplayer"), Tag.find_by(name: "Adventure"), Tag.find_by(name: "Action"), Tag.find_by(name: "3D"), Tag.find_by(name: "Fantasy")],
  platforms: [Platform.find_by(name: "Xbox One"), Platform.find_by(name: "PlayStation 4"), Platform.find_by(name: "Windows")],
)

Game.create(
  name: "Pokemon Shield",
  description: "The world of Pokemon expands to include the Galar region in Pokemon Sword and Pokemon Shield!",
  imageURL: "https://images.igdb.com/igdb/image/upload/t_cover_big/co1zk1.png",
  bannerURL: "https://images.igdb.com/igdb/image/upload/t_screenshot_big/sc67pi.jpg",
  releaseDate: "2013-05-25",
  avg_score: 9.0,
  total_rating: 700,
  genres: [Genre.find_by(name: "Role-playing"), Genre.find_by(name: "Adventure")],
  tags: [Tag.find_by(name: "Singleplayer"), Tag.find_by(name: "Adventure"), Tag.find_by(name: "Action"), Tag.find_by(name: "3D"), Tag.find_by(name: "Soullike")],
  platforms: [Platform.find_by(name: "Xbox One"), Platform.find_by(name: "PlayStation 4"), Platform.find_by(name: "Windows")],
)

Game.create(
  name: "Rocket League",
  description: "Rocket League is a high-powered hybrid of arcade-style soccer and vehicular mayhem with easy-to-understand controls and fluid, physics-driven competition. Rocket League includes casual and competitive Online Matches, a fully-featured offline Season Mode, special 'Mutators' that let you change the rules entirely, hockey and basketball-inspired Extra Modes, and more than 500 trillion possible cosmetic customization combinations.",
  imageURL: "https://images.igdb.com/igdb/image/upload/t_cover_big/co5w0w.png",
  bannerURL: "https://images.igdb.com/igdb/image/upload/t_screenshot_big/ygepetru87ka9nzqowr6.jpg",
  releaseDate: "2021-06-15",
  avg_score: 7.1,
  total_rating: 700,
  genres: [Genre.find_by(name: "Role-playing"), Genre.find_by(name: "Adventure")],
  tags: [Tag.find_by(name: "Singleplayer"), Tag.find_by(name: "Adventure"), Tag.find_by(name: "Action"), Tag.find_by(name: "3D"), Tag.find_by(name: "Soullike")],
  platforms: [Platform.find_by(name: "Xbox One"), Platform.find_by(name: "PlayStation 4"), Platform.find_by(name: "Windows")],
)

Game.create(
  name: "Cassette Beasts",
  description: "Grab your cassette player - it's time to transform! Collect awesome monster forms to use during turn-based battles in this indie open-world RPG. Combine any two monster forms using Cassette Beasts' Fusion System to create unique and powerful new ones!",
  imageURL: "https://images.igdb.com/igdb/image/upload/t_cover_big/co5bqu.png",
  bannerURL: "https://images.igdb.com/igdb/image/upload/t_screenshot_big/sca1u9.jpg",
  releaseDate: "2019-05-15",
  avg_score: 6.7,
  total_rating: 500,
  genres: [Genre.find_by(name: "Role-playing"), Genre.find_by(name: "Adventure")],
  tags: [Tag.find_by(name: "Singleplayer"), Tag.find_by(name: "Adventure"), Tag.find_by(name: "Action"), Tag.find_by(name: "3D"), Tag.find_by(name: "Soullike")],
  platforms: [Platform.find_by(name: "Xbox One"), Platform.find_by(name: "PlayStation 4"), Platform.find_by(name: "Windows")],
)

Game.create(
  name: "Tunic",
  description: "Tunic is an action adventure about a tiny fox in a big world. Explore the wilderness, discover spooky ruins, and fight terrible creatures from long ago.",
  imageURL: "https://images.igdb.com/igdb/image/upload/t_cover_big/td1t8kb33gyo8mvhl2pc.png",
  bannerURL: "https://images.igdb.com/igdb/image/upload/t_screenshot_big/sc8ggj.jpg",
  releaseDate: "2017-05-15",
  avg_score: 5.7,
  total_rating: 550,
  genres: [Genre.find_by(name: "Role-playing"), Genre.find_by(name: "Adventure")],
  tags: [Tag.find_by(name: "Singleplayer"), Tag.find_by(name: "Adventure"), Tag.find_by(name: "Action"), Tag.find_by(name: "3D"), Tag.find_by(name: "Soullike")],
  platforms: [Platform.find_by(name: "Xbox One"), Platform.find_by(name: "PlayStation 4"), Platform.find_by(name: "Windows")],
)

# 25.times do
#   user = User.create(
#     username: Faker::Name.name,
#     email: Faker::Internet.email,
#     password: "password",
#     banner_picture: Faker::LoremFlickr.image(size: "500x300",
#                                              search_terms: ["game"]),
#     user_picture: Faker::LoremFlickr.image(size: "300x300",
#                                            search_terms: ["game"]),
#     bio: Faker::Lorem.paragraph(sentence_count: 2),
#     is_active: true,
#     listsOrder: "planning,playing,completed,paused,dropped",
#   )

#   game = Game.create(
#     name: Faker::Game.title,
#     description: Faker::Lorem.paragraph(sentence_count: 2),
#     imageURL: Faker::LoremFlickr.image(size: "300x300", search_terms: ["game"]),
#     releaseDate: Faker::Date.between(from: "2014-09-23", to: "2021-09-25"),
#     avg_score: Faker::Number.decimal(l_digits: 1, r_digits: 1),
#     total_rating: Faker::Number.between(from: 1, to: 100),
#   )
#   2.times do
#     game.genres << Genre.all.sample
#     game.tags << Tag.all.sample
#     game.platforms << Platform.all.sample
#   end

#   user_game = UserGame.create(
#     user_id: user.id,
#     game_id: game.id,
#     game_status: :Planning,
#     game_note: Faker::Lorem.paragraph(sentence_count: 2),
#     start_date: Faker::Date.between(from: "2014-09-23", to: "2021-09-25"),
#     completed_date: Faker::Date.between(from: "2014-09-23", to: "2021-09-25"),
#     private: Faker::Boolean.boolean(true_ratio: 0.5),
#     rating: Faker::Number.between(from: 1, to: 5), game_note: Faker::Lorem.paragraph(sentence_count: 2),
#   )
# end

user1 = User.create(
  username: "Vv",
  email: "v@gmail.com",
  password: "password",
  banner_picture: "https://images.igdb.com/igdb/image/upload/t_screenshot_big/kky41w6g87pnw8omnoff.jpg",
  user_picture: "https://avatoon.me/wp-content/uploads/2021/09/Cartoon-Pic-Ideas-for-DP-Profile-01.png",
  bio: Faker::Lorem.paragraph(sentence_count: 2),
  is_active: true,
  listsOrder: "planning,playing,completed,paused,dropped",
)

10.times do
  User.create(
    username: Faker::Name.name,
    email: Faker::Internet.email,
    password: "password",
    banner_picture: Faker::LoremFlickr.image(size: "500x300", search_terms: ["profile"]),
    user_picture: Faker::LoremFlickr.image(size: "300x300", search_terms: ["profile"]),
    bio: Faker::Lorem.paragraph(sentence_count: 2),
    is_active: true,
    listsOrder: "planning,playing,completed,paused,dropped",
  )
end

user_game_1 = UserGame.create(
  user_id: user1.id,
  game_id: game1.id,
  game_status: :Planning,
  start_date: Faker::Date.between(from: "2014-09-23", to: "2021-09-25"),
  completed_date: Faker::Date.between(from: "2014-09-23", to: "2021-09-25"),
  private: Faker::Boolean.boolean(true_ratio: 0.5),
  rating: Faker::Number.between(from: 1, to: 5),
  game_note: Faker::Lorem.paragraph(sentence_count: 2),
)

5.times do StatusUpdate.create(
  user_game_id: user_game_1.id,
  status: ["Playing", "Paused", "Dropped", "Completed", "Planning"].sample,
) end

5.times do
  GameJournal.create(
    user_id: user1.id,
    game_id: game1.id,
    content: Faker::Lorem.paragraph(sentence_count: 2),
  )
end

user_game_2 = UserGame.create(
  user_id: user1.id,
  game_id: game2.id,
  game_status: :Playing,
  start_date: Faker::Date.between(from: "2014-09-23", to: "2021-09-25"),
  completed_date: Faker::Date.between(from: "2014-09-23", to: "2021-09-25"),
  private: Faker::Boolean.boolean(true_ratio: 0.5),
  rating: Faker::Number.between(from: 1, to: 5),
  game_note: Faker::Lorem.paragraph(sentence_count: 2),
)

5.times do StatusUpdate.create(
  user_game_id: user_game_2.id,
  status: ["Playing", "Paused", "Dropped", "Completed", "Planning"].sample,
) end

5.times do
  GameJournal.create(
    user_id: user1.id,
    game_id: game2.id,
    content: Faker::Lorem.paragraph(sentence_count: 2),
  )
end

user_game_3 = UserGame.create(
  user_id: user1.id,
  game_id: game3.id,
  game_status: :Playing,
  start_date: Faker::Date.between(from: "2014-09-23", to: "2021-09-25"),
  completed_date: Faker::Date.between(from: "2014-09-23", to: "2021-09-25"),
  private: Faker::Boolean.boolean(true_ratio: 0.5),
  rating: Faker::Number.between(from: 1, to: 5),
  game_note: Faker::Lorem.paragraph(sentence_count: 2),
)

5.times do StatusUpdate.create(
  user_game_id: user_game_3.id,
  status: ["Playing", "Paused", "Dropped", "Completed", "Planning"].sample,
) end

5.times do
  GameJournal.create(
    user_id: user1.id,
    game_id: game3.id,
    content: Faker::Lorem.paragraph(sentence_count: 2),
  )
end
