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

# What is their favourite
# What is their most hated
# What would they do if
# What would they rather

# What is their idea of a perfect day?
# What is their biggest pet peeve?

FactoryBot.create(
  :question,
  question: "What is their favourite film?",
  options: "Nemo, The Lion King, The Incredibles, Toy Story, Titanic, The Godfather, The Shawshank Redemption, The Dark Knight, Forrest Gump, The Matrix"
)

FactoryBot.create(
  :question,
  question: "What is their favourite food?",
  options: "Pizza, Tacos, Sushi, Burgers, Thai, Indian, Chinese, Italian, Mexican, Greek"
)

FactoryBot.create(
  :question,
  question: "What is their favourite color?",
  options: "Red, Blue, Green, Yellow, Orange, Purple, Pink, Black, White, Grey"
)

FactoryBot.create(
  :question,
  question: "What is their favourite animal?",
  options: "Dog, Cat, Horse, Bird, Fish, Hamster, Snake, Lizard, Rabbit, Turtle"
)

FactoryBot.create(
  :question,
  question: "What is their favourite hobby?",
  options: "Reading, Watching TV, Playing Sports, Painting, Cooking, Traveling, Playing Video Games, Listening to Music, Dancing, Yoga"
)

FactoryBot.create(
  :question,
  question: "What is their favourite holiday destination?",
  options: "Beach, Mountains, City, Countryside, Theme Park, Ski Resort, Historical Sites, Nature, Cruise, Camping"
)

FactoryBot.create(
  :question,
  question: "What is their favourite drink?",
  options: "Coffee, Tea, Water, Soda, Juice, Beer, Wine, Whiskey, Vodka, Rum"
)

FactoryBot.create(
  :question,
  question: "What is their favourite book?",
  options: "To Kill a Mockingbird, The Great Gatsby, 1984, Pride and Prejudice, The Catcher in the Rye, The Lord of the Rings, Harry Potter and the Philosopher's Stone, Animal Farm, The Da Vinci Code, The Girl with the Dragon Tattoo"
)

FactoryBot.create(
  :question,
  question: "What is their favourite TV show?",
  options: "Friends, Game of Thrones, Breaking Bad, Stranger Things, The Office, The Crown, Black Mirror, The Big Bang Theory, The Sopranos, Mad Men"
)

FactoryBot.create(
  :question,
  question: "What is their favourite music genre?",
  options: "Pop, Rock, Hip Hop, Country, Jazz, Classical, Electronic, Reggae, Metal, R&B"
)

FactoryBot.create(
  :question,
  question: "What is their favourite cuisine?",
  options: "Italian, Chinese, Indian, Mexican, Thai, Japanese, French, Greek, Spanish, Lebanese"
)

FactoryBot.create(
  :question,
  question: "What is their most hated type of weather?",
  options: "Hot and humid, Cold and wet, Windy, Foggy, Hazy, Stormy, Cloudy, Sunny, Dry and arid, Snowy"
)

FactoryBot.create(
  :question,
  question: "What would they do if they won the lottery?",
  options: "Quit their job, Buy a new house, Travel the world, Invest in stocks, Start a business, Donate to charity, Buy a luxury car, Pay off debt, Save for retirement, Buy a yacht"
)

FactoryBot.create(
  :question,
  question: "What would they rather do for vacation?",
  options: "Relax on a beach, Go on a road trip, Explore a new city, Take a cruise, Go camping, Ski in the mountains, Attend a music festival, Volunteer abroad, Staycation, Go to a theme park"
)

FactoryBot.create(
  :question,
  question: "What would they rather do on a weekend?",
  options: "Read a book, Watch TV, Go hiking, Play video games"
)

FactoryBot.create(
  :question,
  question: "What is their most hated household chore?",
  options: "Doing laundry, Washing dishes, Vacuuming, Cleaning the bathroom"
)

FactoryBot.create(
  :question,
  question: "What is their most hated mode of transportation?",
  options: "Car, Bus, Train, Plane, Boat"
)

FactoryBot.create(
  :question,
  question: "What would they do if they had a day to themselves?",
  options: "Sleep in, Have a spa day, Watch movies, Go shopping"
)

FactoryBot.create(
  :question,
  question: "What would they rather do on a date?",
  options: "Go to a fancy restaurant, Have a picnic, Watch a movie, Play mini-golf"
)

FactoryBot.create(
  :question,
  question: "What is their favourite type of music?",
  options: "Pop, Rock, Hip hop, Jazz, Classical, Country, Electronic, R&B"
)

FactoryBot.create(
  :question,
  question: "What is their most hated type of insect?",
  options: "Mosquito, Cockroach, Spider, Ant, Fly, Bee, Wasp, Tick"
)

