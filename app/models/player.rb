class Player < ApplicationRecord
  belongs_to :room

  COLOURS = ['#f893b8', '#e91e63', '#ff5722', '#ff9800', '#fbe633', '#5dd974', '#00bcd4', '#3f9efd', '#3762ff', '#a644fe'].freeze
  AVATARS = [
    'cold.png',
    'beard.png',
    'crazy.png',
    'devil.png',
    'happy-heart.png',
    'famous.png',
    'cool.png',
    'depression.png',
    'embarrassed.png',
    'emoji.png',
    'fire.png',
    'funny.png',
    'laugh.png',
    'smile.png',
    'smiley.png'
  ].freeze
end
