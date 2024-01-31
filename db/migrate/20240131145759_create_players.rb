class CreatePlayers < ActiveRecord::Migration[7.1]
  def change
    drop_table :players
    create_table :players do |t|
      t.string :name
      t.references :game, foreign_key: true
      t.references :hand_pile, foreign_key: { to_table: :piles }
      t.references :face_down_pile, foreign_key: { to_table: :piles }
      t.references :face_up_pile, foreign_key: { to_table: :piles }
      t.timestamps
    end
    add_foreign_key :players, :games, on_delete: :nullify
  end
end
