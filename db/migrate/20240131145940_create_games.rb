class CreateGames < ActiveRecord::Migration[7.1]
  def change
    create_table :games do |t|
      t.string :name
      t.decimal :number_of_players
      t.references :void_pile, foreign_key: { to_table: :piles }
      t.references :store_pile, foreign_key: { to_table: :piles }
      t.references :game_pile, foreign_key: { to_table: :piles }

      t.timestamps
    end
  end
end
