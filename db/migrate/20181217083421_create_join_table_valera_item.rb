class CreateJoinTableValeraItem < ActiveRecord::Migration[5.2]
  def change
    create_join_table :valeras, :items do |t|
      t.index [:valera_id, :item_id]
      # t.index [:default_item_id, :valera_id]
    end
  end
end
