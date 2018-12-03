class AddValuesToDefaultItems < ActiveRecord::Migration[5.2]
  def up
    items_from_file = YAML.load_file('db/assets/items.yaml')
    items_from_file.each do |features|
      DefaultItem.create(features)
    end
  end

  def down
    DefaultItem.delete_all
  end
end
