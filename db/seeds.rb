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

