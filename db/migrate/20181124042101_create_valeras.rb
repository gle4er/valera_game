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
      t.integer :max_hp
      t.integer :max_mp
      t.integer :level
      t.integer :xp
      t.timestamp :out_time

      t.timestamps
    end
  end
end
