class CreateValeras < ActiveRecord::Migration[5.2]
  def change
    create_table :valeras do |t|
      t.integer :hp
      t.integer :mp
      t.integer :attack
      t.integer :defense
      t.integer :lucky
      t.integer :money
      t.string :skill
      t.integer :maxHp
      t.intger :maxMp
      t.integer :level
      t.integer :xp
      t.timestamp :outTime

      t.timestamps
    end
  end
end
