class Player < ApplicationRecord
  belongs_to :hand_pile, class_name: 'Pile'
  belongs_to :face_down_pile, class_name: 'Pile'
  belongs_to :face_up_pile, class_name: 'Pile'
  belongs_to :game
end
