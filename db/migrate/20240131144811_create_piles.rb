class CreatePiles < ActiveRecord::Migration[7.1]
  def change
    create_table :piles do |t|

      t.timestamps
    end
  end
end
