# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the bin/rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)
require 'factory_bot_rails'

Question.destroy_all
Player.destroy_all
Room.destroy_all

# ------ different logic -------
# Who is more likely to. (don't know how to score this)

# Works with correct logic. -----------
# what is %{questioner}'s favourite
# what is %{questioner} most hated
# what would they do if
# What statement is true about %{questioner}
# True or False

FactoryBot.create(
  :question,
  question: "What statement is true about %{questioner}",
  options: "They love to cook, They have never traveled outside of their home country, They can speak three languages, They have a fear of heights, They are an only child, They have a pet cat, They have a collection of vinyl records, They are left-handed, They are a morning person, They are a night owl, They have run a marathon, They have a fear of public speaking, They can play a musical instrument, They have been skydiving, They have never broken a bone, They have a sweet tooth, They have a fear of spiders, They can solve a Rubik's Cube, They have been in a car accident, They have met a celebrity",
  incorrect_answers: 3,
)

FactoryBot.create(
  :question,
  question: "What statement is true about %{questioner}",
  options: "They have a green thumb, They are a coffee addict, They have climbed a mountain, They have a fear of the dark, They have a photographic memory, They are a skilled dancer, They have a degree in a science field, They have never watched a horror movie, They have a phobia of germs, They have gone bungee jumping, They have a favorite superhero, They have a passion for hiking, They are allergic to peanuts, They have a tattoo, They have won a contest, They have an identical twin, They have a talent for painting, They have been scuba diving, They have gone on a hot air balloon ride",
  incorrect_answers: 3,
)

FactoryBot.create(
  :question,
  question: "What statement is true about %{questioner}",
  options: "They love to travel, They are afraid of dogs, They have a green car, They have a passion for photography, They have a degree in a humanities field, They have never ridden a horse, They have a favorite book series, They have a talent for public speaking, They have never been on a plane, They have a fear of heights, They are a skilled singer, They have a collection of movie memorabilia, They have been in a long-distance relationship, They have a pet reptile, They have a talent for cooking, They have a phobia of clowns, They have gone on a road trip, They have a passion for astronomy, They have never been camping",
  incorrect_answers: 3,
)

FactoryBot.create(
  :question,
  question: "What statement is true about %{questioner}",
  options: "They love to read, They have a fear of water, They have a passion for fashion, They have a degree in a business field, They have never seen snow, They have a favorite type of cuisine, They have a talent for woodworking, They have a fear of flying, They have never been to a concert, They have a pet bird, They are a skilled writer, They have a collection of art, They have been on a cruise, They have a phobia of needles, They have a talent for drawing, They have gone on a solo trip, They have a passion for gardening, They have a birthmark, They have never tried sushi",
  incorrect_answers: 3,
)

FactoryBot.create(
  :question,
  question: "What statement is true about %{questioner}",
  options: "They love to exercise, They have a fear of thunderstorms, They have a passion for theater, They have a degree in an engineering field, They have never been on a roller coaster, They have a favorite musical artist, They have a talent for playing video games, They have a fear of enclosed spaces, They have never seen the ocean, They have a pet dog, They are a skilled musician, They have a collection of antiques, They have been on a safari, They have a phobia of heights, They have a talent for singing, They have gone on a backpacking trip, They have a passion for knitting, They have a scar, They have never ridden a bike",
  incorrect_answers: 3,
)

FactoryBot.create(
  :question,
  question: "What statement is true about %{questioner}",
  options: "They love to watch movies, They have a fear of snakes, They have a passion for history, They have a degree in a social science field, They have never been skiing, They have a favorite TV show, They have a talent for solving puzzles, They have a fear of germs, They have never been to a theme park"
  incorrect_answers: 3,
)

FactoryBot.create(
  :question,
  question: "%{questioner} once ate a whole pizza by themselves.",
  options: "True, False",
  incorrect_answers: 1,
)

FactoryBot.create(
  :question,
  question: "%{questioner} has had a threesome.",
  options: "True, False",
  incorrect_answers: 1,
)

FactoryBot.create(
  :question,
  question: "%{questioner} has never been in love.",
  options: "True, False",
  incorrect_answers: 1,
)

FactoryBot.create(
  :question,
  question: "%{questioner} has kissed someone of the same gender.",
  options: "True, False",
  incorrect_answers: 1,
)

FactoryBot.create(
  :question,
  question: "%{questioner} has had a one night stand.",
  options: "True, False",
  incorrect_answers: 1,
)

FactoryBot.create(
  :question,
  question: "%{questioner} has cheated on a significant other.",
  options: "True, False",
  incorrect_answers: 1,
)

FactoryBot.create(
  :question,
  question: "%{questioner} has dated someone significantly older or younger than them.",
  options: "True, False",
  incorrect_answers: 1,
)

FactoryBot.create(
  :question,
  question: "%{questioner} has had sex in a public place.",
  options: "True, False",
  incorrect_answers: 1,
)

FactoryBot.create(
  :question,
  question: "%{questioner} has sent or received explicit pictures or videos.",
  options: "True, False",
  incorrect_answers: 1,
)

FactoryBot.create(
  :question,
  question: "%{questioner} has had a crush on a friend's significant other.",
  options: "True, False",
  incorrect_answers: 1,
)

FactoryBot.create(
  :question,
  question: "%{questioner} has been in a friends with benefits arrangement.",
  options: "True, False",
  incorrect_answers: 1,
)

FactoryBot.create(
  :question,
  question: "%{questioner} has had a pregnancy scare.",
  options: "True, False",
  incorrect_answers: 1,
)

FactoryBot.create(
  :question,
  question: "%{questioner} has lied to their partner about their whereabouts.",
  options: "True, False",
  incorrect_answers: 1,
)

FactoryBot.create(
  :question,
  question: "%{questioner} has had a threesome with two people of the same gender.",
  options: "True, False",
  incorrect_answers: 1,
)

FactoryBot.create(
  :question,
  question: "%{questioner} has used a dating app while in a relationship.",
  options: "True, False",
  incorrect_answers: 1,
)

FactoryBot.create(
  :question,
  question: "%{questioner} has been sexually attracted to a family member.",
  options: "True, False",
  incorrect_answers: 1,
)

FactoryBot.create(
  :question,
  question: "%{questioner} has had a crush on a celebrity.",
  options: "True, False",
  incorrect_answers: 1,
)

FactoryBot.create(
  :question,
  question: "%{questioner} has slept with someone they met online on the first date.",
  options: "True, False",
  incorrect_answers: 1,
)

FactoryBot.create(
  :question,
  question: "%{questioner} has had an affair with a married person.",
  options: "True, False",
  incorrect_answers: 1,
)

FactoryBot.create(
  :question,
  question: "%{questioner}'s partner has caught them watching porn.",
  options: "True, False",
  incorrect_answers: 1,
)

FactoryBot.create(
  :question,
  question: "%{questioner} has had sex in a place where they could have been caught.",
  options: "True, False",
  incorrect_answers: 1,
)

FactoryBot.create(
  :question,
  question: "%{questioner}'s partner has asked them to stop talking to an ex.",
  options: "True, False",
  incorrect_answers: 1,
)

FactoryBot.create(
  :question,
  question: "%{questioner} has had a crush on their boss.",
  options: "True, False",
  incorrect_answers: 1,
)

FactoryBot.create(
  :question,
  question: "%{questioner}'s partner has asked them to change something about their appearance.",
  options: "True, False",
  incorrect_answers: 1,
)

FactoryBot.create(
  :question,
  question: "%{questioner} has been in a relationship with someone they met while in a relationship with someone else.",
  options: "True, False",
  incorrect_answers: 1,
)

FactoryBot.create(
  :question,
  question: "%{questioner} has been intimate with someone they knew for less than 24 hours.",
  options: "True, False",
  incorrect_answers: 1,
)

FactoryBot.create(
  :question,
  question: "%{questioner}'s partner has read their messages without permission.",
  options: "True, False",
  incorrect_answers: 1,
)

FactoryBot.create(
  :question,
  question: "%{questioner} has had sex with someone who they knew was in a relationship.",
  options: "True, False",
  incorrect_answers: 1,
)

FactoryBot.create(
  :question,
  question: "%{questioner}'s partner has lied to them about their past sexual experiences.",
  options: "True, False",
  incorrect_answers: 1,
)

FactoryBot.create(
  :question,
  question: "If %{questioner} had to lie about their whereabouts, where would they say they were?",
  options: "The pub, Golfing, At work, At the gym, At the beach, At a friend's house, On a business trip, Running errands, Doing volunteer work, At the library, Shopping, Hiking, Fishing, Watching a movie, Cooking class, Yoga class, Taking a nap, Traveling, Attending a concert, Attending a sporting event",
  incorrect_answers: 3,
)

FactoryBot.create(
  :question,
  question: "What is %{questioner}'s favourite film?",
  options: "The Godfather, The Shawshank Redemption, The Dark Knight, Forrest Gump, Pulp Fiction, Fight Club, Goodfellas, The Silence of the Lambs, Schindler's List, Star Wars, Titanic, The Lion King, The Incredibles, Toy Story, The Matrix, Gladiator, Inception, Interstellar, Forrest Gump, The Green Mile",
  incorrect_answers: 3,
)

FactoryBot.create(
  :question,
  question: "What is %{questioner}'s favourite food?",
  options: "Pizza, Tacos, Sushi, Burgers, Thai, Indian, Chinese, Italian, Mexican, Greek, Japanese, Korean, French, Lebanese, Vietnamese, Spanish, Brazilian, Moroccan, Turkish, Ethiopian, Jamaican",
  incorrect_answers: 3,
)

FactoryBot.create(
  :question,
  question: "What is %{questioner}'s favourite colour?",
  options: "Red, Blue, Green, Yellow, Orange, Purple, Pink, Black, White, Grey, Brown, Navy, Teal, Maroon, Olive, Turquoise, Lavender, Magenta, Coral, Beige",
  incorrect_answers: 3,
)

FactoryBot.create(
  :question,
  question: "What is %{questioner}'s favourite animal?",
  options: "Dog, Cat, Horse, Bird, Fish, Hamster, Snake, Lizard, Rabbit, Turtle, Elephant, Lion, Tiger, Gorilla, Monkey, Dolphin, Octopus, Penguin, Koala, Polar Bear",
  incorrect_answers: 3,
)

FactoryBot.create(
  :question,
  question: "What is %{questioner}'s favourite hobby?",
  options: "Reading, Watching TV, Playing Sports, Painting, Cooking, Traveling, Playing Video Games, Listening to Music, Dancing, Yoga, Hiking, Photography, Writing, Fishing, Knitting, Gardening, Collecting, Meditation, Singing, Scuba Diving",
  incorrect_answers: 3,
)

FactoryBot.create(
  :question,
  question: "What is %{questioner}'s favourite holiday destination?",
  options: "Beach, Mountains, City, Countryside, Theme Park, Ski Resort, Historical Sites, Nature, Cruise, Camping, Safari, Island, Desert, Forest, Glacier, Volcano, Waterfall, Vineyard, Spa, Castle",
  incorrect_answers: 3,
)

FactoryBot.create(
  :question,
  question: "What is %{questioner}'s favourite drink?",
  options: "Coffee, Tea, Water, Soda, Juice, Beer, Wine, Whiskey, Vodka, Rum, Gin, Tequila, Champagne, Brandy, Milkshake, Smoothie, Lemonade, Iced Tea, Hot Chocolate, Cocktails",
  incorrect_answers: 3,
)

FactoryBot.create(
  :question,
  question: "What is %{questioner}'s favourite book?",
  options: "To Kill a Mockingbird, The Great Gatsby, 1984, Pride and Prejudice, The Catcher in the Rye, The Lord of the Rings, Harry Potter and the Philosopher's Stone, Animal Farm, The Da Vinci Code, The Girl with the Dragon Tattoo, One Hundred Years of Solitude, The Hitchhiker's Guide to the Galaxy, The Alchemist, Crime and Punishment, Wuthering Heights, The Picture of Dorian Gray, The Count of Monte Cristo, The Adventures of Huckleberry Finn, The Chronicles of Narnia",
  incorrect_answers: 3,
)

FactoryBot.create(
  :question,
  question: "If %{questioner} could have any superpower, what would it be?",
  options: "Flying, Invisibility, Teleportation, Super strength, Mind reading, Time travel, Shape-shifting, Healing, Telekinesis, Elemental control, Animal control, Technopathy, Super speed, X-ray vision, Precognition, Intangibility, Duplication, Elasticity, Force field generation, Summoning",
  incorrect_answers: 3,
)

FactoryBot.create(
  :question,
  question: "If %{questioner} could only eat one food for the rest of their life, what would it be?",
  options: "Pizza, Tacos, Sushi, Burgers, Thai food, Indian food, Chinese food, Italian food, Mexican food, Greek food, Japanese food, Korean food, French food, Lebanese food, Vietnamese food, Spanish food, Brazilian food, Moroccan food, Turkish food, Ethiopian food, Jamaican food",
  incorrect_answers: 3,
)

FactoryBot.create(
  :question,
  question: "If %{questioner} were a character in a horror movie, what role would they play?",
  options: "The final girl/boy, The first to die, The comic relief, The skeptic, The wise old sage, The evil mastermind, The sidekick, The monster, The survivor, The sacrificial lamb, The hero, The villain, The possessed, The haunted, The investigator, The psychic, The ghost, The zombie, The werewolf, The vampire",
  incorrect_answers: 3,
)

FactoryBot.create(
  :question,
  question: "If %{questioner} could be any fictional character, who would they be?",
  options: "Harry Potter, Hermione Granger, Gandalf, Frodo Baggins, Katniss Everdeen, Sherlock Holmes, Dracula, Wonder Woman, Iron Man, Superman, Batman, Spider-Man, Captain America, The Incredible Hulk, Elsa (Frozen), Belle (Beauty and the Beast), Mulan, Moana, T'Challa (Black Panther), Tony Montana (Scarface)",
  incorrect_answers: 3,
)

FactoryBot.create(
  :question,
  question: "If %{questioner} were stranded on a deserted island, what one thing would they want with them?",
  options: "A satellite phone, A knife, A fishing net, A water filter, A flare gun, A map, A hammock, A book, A solar-powered charger, A sturdy shelter, A radio, A fishing rod, A camera, A musical instrument, A spear gun, A volleyball, A fire starter, A tent, A compass, A cooking pot",
  incorrect_answers: 3,
)

FactoryBot.create(
  :question,
  question: "What is %{questioner}'s favourite TV show?",
  options: "Friends, Game of Thrones, Breaking Bad, Stranger Things, The Office, The Crown, Black Mirror, The Big Bang Theory, The Sopranos, Mad Men",
  incorrect_answers: 3,
)

FactoryBot.create(
  :question,
  question: "What is %{questioner}'s favourite music genre?",
  options: "Pop, Rock, Hip Hop, Country, Jazz, Classical, Electronic, Reggae, Metal, R&B",
  incorrect_answers: 3,#
)

FactoryBot.create(
  :question,
  question: "What is %{questioner}'s favourite cuisine?",
  options: "Italian, Chinese, Indian, Mexican, Thai, Japanese, French, Greek, Spanish, Lebanese",
  incorrect_answers: 3,#
)

 FactoryBot.create(
   :question,
   question: "What is %{questioner} most hated type of weather?",
   options: "Hot and humid, Cold and wet, Windy, Foggy, Hazy, Stormy, Cloudy, Sunny, Dry and arid, Snowy",
  incorrect_answers: 3,
)

 FactoryBot.create(
   :question,
   question: "What would %{questioner} do if %{questioner} won the lottery?",
   options: "Quit %{questioner} job, Buy a new house, Travel the world, Invest in stocks, Start a business, Donate to charity, Buy a luxury car, Pay off debt, Save for retirement, Buy a yacht",
  incorrect_answers: 3,
)

 FactoryBot.create(
   :question,
   question: "What would %{questioner} rather do for vacation?",
   options: "Relax on a beach, Go on a road trip, Explore a new city, Take a cruise, Go camping, Ski in the mountains, Attend a music festival, Volunteer abroad, Staycation, Go to a theme park",
  incorrect_answers: 3,
)

 FactoryBot.create(
   :question,
   question: "What would %{questioner} rather do on a weekend?",
   options: "Read a book, Watch TV, Go hiking, Play video games",
  incorrect_answers: 3,
)

 FactoryBot.create(
   :question,
   question: "What is %{questioner} most hated household chore?",
   options: "Doing laundry, Washing dishes, Vacuuming, Cleaning the bathroom",
  incorrect_answers: 3,
)

 FactoryBot.create(
   :question,
   question: "What is %{questioner} most hated mode of transportation?",
   options: "Car, Bus, Train, Plane, Boat",
  incorrect_answers: 3,
)

 FactoryBot.create(
   :question,
   question: "What would %{questioner} do if %{questioner} had a day to themselves?",
   options: "Sleep in, Have a spa day, Watch movies, Go shopping",
  incorrect_answers: 3,
)

 FactoryBot.create(
   :question,
   question: "What would %{questioner} rather do on a date?",
   options: "Go to a fancy restaurant, Have a picnic, Watch a movie, Play mini-golf",
  incorrect_answers: 3,
)

 FactoryBot.create(
   :question,
   question: "What is %{questioner}'s favourite type of music?",
   options: "Pop, Rock, Hip hop, Jazz, Classical, Country, Electronic, R&B",
  incorrect_answers: 3,
)

 FactoryBot.create(
   :question,
   question: "What is %{questioner} most hated type of insect?",
   options: "Mosquito, Cockroach, Spider, Ant, Fly, Bee, Wasp, Tick",
  incorrect_answers: 3,
)

 FactoryBot.create(
   :question,
   question: "What is %{questioner}'s favourite type of movie?",
   options: "Action, Comedy, Drama, Horror, Romance, Sci-fi, Thriller, Documentary, Animated, Musical",
  incorrect_answers: 3,
  )

 FactoryBot.create(
   :question,
   question: "What is %{questioner} most loved type of pet?",
   options: "Dog, Cat, Fish, Bird, Hamster, Guinea pig, Rabbit, Snake, Lizard, Horse",
  incorrect_answers: 3,
)

 FactoryBot.create(
   :question,
   question: "What would %{questioner} rather eat for breakfast?",
   options: "Eggs and bacon, Pancakes, Cereal, Toast and jam, Smoothie, Oatmeal, Bagel and cream cheese, Yogurt and fruit, Avocado toast, Breakfast burrito",
  incorrect_answers: 3,
)

 FactoryBot.create(
   :question,
   question: "What would %{questioner} rather do in their free time?",
   options: "Play sports, Do crafts, Cook, Garden, Play music, Dance, Write, Paint, Meditate, Play board games",
  incorrect_answers: 3,
)

 FactoryBot.create(
   :question,
   question: "What is %{questioner} most favourite type of book?",
   options: "Fiction, Non-fiction, Biography, Autobiography, History, Science, Self-help, Poetry, Romance, Mystery",
  incorrect_answers: 3,
)

FactoryBot.create(
  :question,
  question: "What is %{questioner}'s favorite outdoor activity?",
  options: "Hiking, Biking, Camping, Fishing, Kayaking, Running, Swimming, Surfing, Skiing, Snowboarding",
  incorrect_answers: 3,
)

FactoryBot.create(
  :question,
  question: "What is %{questioner}'s favorite type of cuisine?",
  options: "Italian, Chinese, Indian, Mexican, Thai, Japanese, French, Greek, Spanish, Lebanese",
  incorrect_answers: 3,
)

FactoryBot.create(
  :question,
  question: "What is %{questioner}'s favorite type of dessert?",
  options: "Cake, Ice cream, Pie, Cookies, Brownies, Cheesecake, Tiramisu, Pudding, Cupcakes, Donuts",
  incorrect_answers: 3,
)

FactoryBot.create(
  :question,
  question: "What is %{questioner}'s favorite type of movie?",
  options: "Action, Comedy, Drama, Horror, Romance, Sci-Fi, Thriller, Documentary, Animated, Musical",
  incorrect_answers: 3,
)

FactoryBot.create(
  :question,
  question: "What is %{questioner}'s favorite type of book?",
  options: "Fiction, Non-fiction, Mystery, Romance, Thriller, Science Fiction, Biography, Autobiography, History, Poetry",
  incorrect_answers: 3,
)

FactoryBot.create(
  :question,
  question: "What is %{questioner}'s favorite type of sport?",
  options: "Football, Basketball, Soccer, Tennis, Golf, Baseball, Hockey, Swimming, Running, Boxing",
  incorrect_answers: 3,
)

FactoryBot.create(
  :question,
  question: "What is %{questioner}'s favorite type of game?",
  options: "Board games, Card games, Video games, Sports games, Puzzle games, Trivia games, Party games, Role-playing games, Action games, Adventure games",
  incorrect_answers: 3,
)

FactoryBot.create(
  :question,
  question: "What is %{questioner}'s favorite type of animal?",
  options: "Dog, Cat, Bird, Fish, Rabbit, Hamster, Guinea pig, Turtle, Lizard, Snake",
  incorrect_answers: 3,
)

FactoryBot.create(
  :question,
  question: "What is %{questioner}'s favorite colour?",
  options: "Red, Blue, Green, Yellow, Orange, Purple, Pink, Brown, Gray, Black",
  incorrect_answers: 3,
)

FactoryBot.create(
  :question,
  question: "What is %{questioner}'s favorite season?",
  options: "Spring, Summer, Fall, Winter",
  incorrect_answers: 3,
)

FactoryBot.create(
  :question,
  question: "What is %{questioner}'s favorite hobby?",
  options: "Cooking, Photography, Painting, Drawing, Writing, Reading, Playing music, Dancing, Singing, Gardening",
  incorrect_answers: 3,
)

FactoryBot.create(
  :question,
  question: "What is %{questioner}'s favorite type of exercise?",
  options: "Yoga, Pilates, Weight lifting, Running, Swimming, Cycling, Boxing, Martial arts, Dance, HIIT",
  incorrect_answers: 3,
)

FactoryBot.create(
  :question,
  question: "What is %{questioner}'s favorite type of TV show?",
  options: "Drama, Comedy, Reality TV, Documentary, Crime, Fantasy, Science Fiction, Action, Adventure, Horror",
  incorrect_answers: 3,
)

FactoryBot.create(
  :question,
  question: "What is %{questioner}'s favorite type of weather?",
  options: "Sunny, Cloudy, Rainy, Snowy, Foggy, Stormy, Hazy, Windy, Hot and humid, Cold and dry",
  incorrect_answers: 3,
)

FactoryBot.create(
  :question,
  question: "%{questioner} would rather fight one horse-sized duck or one hundred duck-sized horses?",
  options: "One horse-sized duck, One hundred duck-sized horses",
  incorrect_answers: 1,
)

FactoryBot.create(
  :question,
  question: "%{questioner} thinks that aliens exist and have visited Earth.",
  options: "True, False",
  incorrect_answers: 1,
)

FactoryBot.create(
  :question,
  question: "Has %{questioner} ever stolen something?",
  options: "Yes, No",
  incorrect_answers: 1,
)

FactoryBot.create(
  :question,
  question: "%{questioner} has a secret talent for singing karaoke.",
  options: "True, False",
  incorrect_answers: 1,
)

FactoryBot.create(
  :question,
  question: "If %{questioner} could only eat one food for the rest of their life, what would it be?",
  options: "Pizza, Tacos, Sushi, Hamburgers, Ice cream, Other",
  incorrect_answers: 1,
)

FactoryBot.create(
  :question,
  question: "Has %{questioner} ever gone streaking?",
  options: "Yes, No",
  incorrect_answers: 1,
)

FactoryBot.create(
  :question,
  question: "%{questioner} has a favorite conspiracy theory.",
  options: "True, False",
  incorrect_answers: 1,
)

FactoryBot.create(
  :question,
  question: "Has %{questioner} ever been arrested?",
  options: "Yes, No",
  incorrect_answers: 1,
)

FactoryBot.create(
  :question,
  question: "%{questioner} believes that Bigfoot is real.",
  options: "True, False",
  incorrect_answers: 1,
)

FactoryBot.create(
  :question,
  question: "%{questioner} has a secret obsession with a reality TV show.",
  options: "True, False",
  incorrect_answers: 1,
)

FactoryBot.create(
  :question,
  question: "If %{questioner} were stranded on a desert island and could only bring one item, what would it be?",
  options: "A knife, A book, A satellite phone, A surfboard, A tent, A water filter, A fishing net, A hammock, A flare gun, A solar charger, A map, A waterproof lighter, A first aid kit, A water bottle, A fishing rod, A pot or pan, A machete, A waterproof container, A portable shelter",
  incorrect_answers: 3,
  )
