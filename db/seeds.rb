# This file should ensure the existence of records required to run the application in every environment (production,
# development, test). The code here should be idempotent so that it can be executed at any point in every environment.
# The data can then be loaded with the bin/rails db:seed command (or created alongside the database with db:setup).
#
# Example:
#
#   ["Action", "Comedy", "Drama", "Horror"].each do |genre_name|
#     MovieGenre.find_or_create_by!(name: genre_name)
#   end

%w[2 3 4 5 6 7 8 9 10 11 12 13 14].each do |weight|
  description = case weight
                              when '2'  then "Cards of any kind with a weight of 2 will reset the pile count and will bypass the weight requirement"
                              when '3'  then "Cards of any kind with a weight of 3 will skip your turn while maintaining the weight of the previous card 3 is commonly considered the strongest card"
                              when '7'  then "Cards of any kind with a weight of 7 will require the next card to be lower than or equal to 7. This effect is bypassed by all other special cards. This card is commonly considered the weakest of the special cards"
                              when '10' then "Cards of any kind with a weight of 10 will remove the current pile of cards and will bypass the weight requirement."
                              else "Regular cards with their weight annotated on the face of the card. And as for the face cards: Jack < Queen < King < Ace"
                              end
  puts "reaches"
  Card.find_or_create_by! weight: weight, color: :Spades, description: description, :pile_id => nil
  Card.find_or_create_by! weight: weight, color: :Hearts, description: description, :pile_id => nil
  Card.find_or_create_by! weight: weight, color: :Diamonds, description: description, :pile_id => nil
  Card.find_or_create_by! weight: weight, color: :Clubs, description: description, :pile_id => nil
end
%w[1 2 3 4].each do |name|
  Player.find_or_create_by! name: "bot#{name}"
end
