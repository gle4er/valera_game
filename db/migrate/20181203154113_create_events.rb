class CreateEvents < ActiveRecord::Migration[5.2]
  def change
    create_table :events do |t|
      t.string :name
      t.integer :hp
      t.integer :mp
      t.integer :attack
      t.integer :defense
      t.integer :lucky
      t.integer :money
      t.integer :xp

      t.timestamps
    end
  end
end
