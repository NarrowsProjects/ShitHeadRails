class Pile < ApplicationRecord
  has_one :player, foreign_key:"hand_pile_id",required: false,  dependent: :destroy
  has_one :player, foreign_key:"face_up_pile_id",required: false,  dependent: :destroy
  has_one :player, foreign_key:"face_down_pile_id",required: false,  dependent: :destroy
  has_many :cards, foreign_key:"pile_id",  dependent: :destroy
end
