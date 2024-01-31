class Card < ApplicationRecord
  enum weight: %w[2 3 4 5 6 7 8 9 10 11 12 13 14]
  enum color: %i[Spades Diamonds Hearts Clubs]
  belongs_to :pile
end