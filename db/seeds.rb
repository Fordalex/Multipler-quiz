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

# What is %{questioner}'s favourite
# What is %{questioner} most hated
# What would they do if
# What would they rather

# What is %{questioner} idea of a perfect day?
# What is %{questioner} biggest pet peeve?

FactoryBot.create(
  :question,
  question: "What is %{questioner}'s favourite film?",
  options: "Nemo, The Lion King, The Incredibles, Toy Story, Titanic, The Godfather, The Shawshank Redemption, The Dark Knight, Forrest Gump, The Matrix"
)

FactoryBot.create(
  :question,
  question: "What is %{questioner}'s favourite food?",
  options: "Pizza, Tacos, Sushi, Burgers, Thai, Indian, Chinese, Italian, Mexican, Greek"
)

FactoryBot.create(
  :question,
  question: "What is %{questioner}'s favourite color?",
  options: "Red, Blue, Green, Yellow, Orange, Purple, Pink, Black, White, Grey"
)

FactoryBot.create(
  :question,
  question: "What is %{questioner}'s favourite animal?",
  options: "Dog, Cat, Horse, Bird, Fish, Hamster, Snake, Lizard, Rabbit, Turtle"
)

FactoryBot.create(
  :question,
  question: "What is %{questioner}'s favourite hobby?",
  options: "Reading, Watching TV, Playing Sports, Painting, Cooking, Traveling, Playing Video Games, Listening to Music, Dancing, Yoga"
)

FactoryBot.create(
  :question,
  question: "What is %{questioner}'s favourite holiday destination?",
  options: "Beach, Mountains, City, Countryside, Theme Park, Ski Resort, Historical Sites, Nature, Cruise, Camping"
)

FactoryBot.create(
  :question,
  question: "What is %{questioner}'s favourite drink?",
  options: "Coffee, Tea, Water, Soda, Juice, Beer, Wine, Whiskey, Vodka, Rum"
)

FactoryBot.create(
  :question,
  question: "What is %{questioner}'s favourite book?",
  options: "To Kill a Mockingbird, The Great Gatsby, 1984, Pride and Prejudice, The Catcher in the Rye, The Lord of the Rings, Harry Potter and the Philosopher's Stone, Animal Farm, The Da Vinci Code, The Girl with the Dragon Tattoo"
)

FactoryBot.create(
  :question,
  question: "What is %{questioner}'s favourite TV show?",
  options: "Friends, Game of Thrones, Breaking Bad, Stranger Things, The Office, The Crown, Black Mirror, The Big Bang Theory, The Sopranos, Mad Men"
)

FactoryBot.create(
  :question,
  question: "What is %{questioner}'s favourite music genre?",
  options: "Pop, Rock, Hip Hop, Country, Jazz, Classical, Electronic, Reggae, Metal, R&B"
)

FactoryBot.create(
  :question,
  question: "What is %{questioner}'s favourite cuisine?",
  options: "Italian, Chinese, Indian, Mexican, Thai, Japanese, French, Greek, Spanish, Lebanese"
)

FactoryBot.create(
  :question,
  question: "What is %{questioner} most hated type of weather?",
  options: "Hot and humid, Cold and wet, Windy, Foggy, Hazy, Stormy, Cloudy, Sunny, Dry and arid, Snowy"
)

FactoryBot.create(
  :question,
  question: "What would %{questioner} do if %{questioner} won the lottery?",
  options: "Quit %{questioner} job, Buy a new house, Travel the world, Invest in stocks, Start a business, Donate to charity, Buy a luxury car, Pay off debt, Save for retirement, Buy a yacht"
)

FactoryBot.create(
  :question,
  question: "What would %{questioner} rather do for vacation?",
  options: "Relax on a beach, Go on a road trip, Explore a new city, Take a cruise, Go camping, Ski in the mountains, Attend a music festival, Volunteer abroad, Staycation, Go to a theme park"
)

FactoryBot.create(
  :question,
  question: "What would %{questioner} rather do on a weekend?",
  options: "Read a book, Watch TV, Go hiking, Play video games"
)

FactoryBot.create(
  :question,
  question: "What is %{questioner} most hated household chore?",
  options: "Doing laundry, Washing dishes, Vacuuming, Cleaning the bathroom"
)

FactoryBot.create(
  :question,
  question: "What is %{questioner} most hated mode of transportation?",
  options: "Car, Bus, Train, Plane, Boat"
)

FactoryBot.create(
  :question,
  question: "What would %{questioner} do if %{questioner} had a day to themselves?",
  options: "Sleep in, Have a spa day, Watch movies, Go shopping"
)

FactoryBot.create(
  :question,
  question: "What would %{questioner} rather do on a date?",
  options: "Go to a fancy restaurant, Have a picnic, Watch a movie, Play mini-golf"
)

FactoryBot.create(
  :question,
  question: "What is %{questioner}'s favourite type of music?",
  options: "Pop, Rock, Hip hop, Jazz, Classical, Country, Electronic, R&B"
)

FactoryBot.create(
  :question,
  question: "What is %{questioner} most hated type of insect?",
  options: "Mosquito, Cockroach, Spider, Ant, Fly, Bee, Wasp, Tick"
)

FactoryBot.create(
  :question,
  question: "What is %{questioner}'s favourite type of movie?",
  options: "Action, Comedy, Drama, Horror, Romance, Sci-fi, Thriller, Documentary, Animated, Musical"
  )

FactoryBot.create(
  :question,
  question: "What is %{questioner} most loved type of pet?",
  options: "Dog, Cat, Fish, Bird, Hamster, Guinea pig, Rabbit, Snake, Lizard, Horse"
)

FactoryBot.create(
  :question,
  question: "What would %{questioner} rather eat for breakfast?",
  options: "Eggs and bacon, Pancakes, Cereal, Toast and jam, Smoothie, Oatmeal, Bagel and cream cheese, Yogurt and fruit, Avocado toast, Breakfast burrito"
)

FactoryBot.create(
  :question,
  question: "What would %{questioner} rather do in their free time?",
  options: "Play sports, Do crafts, Cook, Garden, Play music, Dance, Write, Paint, Meditate, Play board games"
)

FactoryBot.create(
  :question,
  question: "What is %{questioner} most favourite type of book?",
  options: "Fiction, Non-fiction, Biography, Autobiography, History, Science, Self-help, Poetry, Romance, Mystery"
)

FactoryBot.create(
  :question,
  question: "What is %{questioner}'s favorite outdoor activity?",
  options: "Hiking, Biking, Camping, Fishing, Kayaking, Running, Swimming, Surfing, Skiing, Snowboarding"
)

FactoryBot.create(
  :question,
  question: "What is %{questioner}'s favorite type of cuisine?",
  options: "Italian, Chinese, Indian, Mexican, Thai, Japanese, French, Greek, Spanish, Lebanese"
)

FactoryBot.create(
  :question,
  question: "What is %{questioner}'s favorite type of dessert?",
  options: "Cake, Ice cream, Pie, Cookies, Brownies, Cheesecake, Tiramisu, Pudding, Cupcakes, Donuts"
)

FactoryBot.create(
  :question,
  question: "What is %{questioner}'s favorite type of movie?",
  options: "Action, Comedy, Drama, Horror, Romance, Sci-Fi, Thriller, Documentary, Animated, Musical"
)

FactoryBot.create(
  :question,
  question: "What is %{questioner}'s favorite type of book?",
  options: "Fiction, Non-fiction, Mystery, Romance, Thriller, Science Fiction, Biography, Autobiography, History, Poetry"
)

FactoryBot.create(
  :question,
  question: "What is %{questioner}'s favorite type of sport?",
  options: "Football, Basketball, Soccer, Tennis, Golf, Baseball, Hockey, Swimming, Running, Boxing"
)

FactoryBot.create(
  :question,
  question: "What is %{questioner}'s favorite type of game?",
  options: "Board games, Card games, Video games, Sports games, Puzzle games, Trivia games, Party games, Role-playing games, Action games, Adventure games"
)

FactoryBot.create(
  :question,
  question: "What is %{questioner}'s favorite type of animal?",
  options: "Dog, Cat, Bird, Fish, Rabbit, Hamster, Guinea pig, Turtle, Lizard, Snake"
)

FactoryBot.create(
  :question,
  question: "What is %{questioner}'s favorite color?",
  options: "Red, Blue, Green, Yellow, Orange, Purple, Pink, Brown, Gray, Black"
)

FactoryBot.create(
  :question,
  question: "What is %{questioner}'s favorite season?",
  options: "Spring, Summer, Fall, Winter"
)

FactoryBot.create(
  :question,
  question: "What is %{questioner}'s favorite hobby?",
  options: "Cooking, Photography, Painting, Drawing, Writing, Reading, Playing music, Dancing, Singing, Gardening"
)

FactoryBot.create(
  :question,
  question: "What is %{questioner}'s favorite type of exercise?",
  options: "Yoga, Pilates, Weight lifting, Running, Swimming, Cycling, Boxing, Martial arts, Dance, HIIT"
)

FactoryBot.create(
  :question,
  question: "What is %{questioner}'s favorite type of TV show?",
  options: "Drama, Comedy, Reality TV, Documentary, Crime, Fantasy, Science Fiction, Action, Adventure, Horror"
)

FactoryBot.create(
  :question,
  question: "What is %{questioner}'s favorite type of weather?",
  options: "Sunny, Cloudy, Rainy, Snowy, Foggy, Stormy, Hazy, Windy, Hot and humid, Cold and dry"
)

