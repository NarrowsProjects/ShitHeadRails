class CreateCards < ActiveRecord::Migration[7.1]
  def change
    create_table :cards do |t|
      t.integer :weight, default: 2
      t.integer :color, default: :Spades
      t.text :description
      t.references :pile, foreign_key: true, null:true
      t.timestamps
    end
  end
end
