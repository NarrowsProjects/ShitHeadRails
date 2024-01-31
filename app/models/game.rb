class Game < ApplicationRecord
  belongs_to :void_pile, class_name: 'Pile',  dependent: :delete
  belongs_to :store_pile, class_name: 'Pile', dependent: :destroy
  belongs_to :game_pile, class_name: 'Pile',  dependent: :destroy
  has_many :players, class_name: 'Player', dependent: :destroy
end
