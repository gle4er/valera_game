class CreateEvents < ActiveRecord::Migration[5.2]
  def change
    create_table :events do |t|
      t.string :name, null: false
      t.integer :hp, null: false
      t.integer :mp, null: false
      t.integer :attack, null: false
      t.integer :defense, null: false
      t.integer :lucky, null: false
      t.integer :money, null: false
      t.integer :xp, null: false

      t.timestamps
    end
  end
end
