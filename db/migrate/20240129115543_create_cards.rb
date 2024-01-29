class CreateCards < ActiveRecord::Migration[7.1]
  def change
    drop_table :cards, table_exists?:true
    create_table :cards do |t|
      t.integer :weight, default: 2
      t.integer :color, default: :Spades
      t.text :description

      t.timestamps
    end
  end
end
