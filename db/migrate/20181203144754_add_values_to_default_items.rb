class AddValuesToDefaultItems < ActiveRecord::Migration[5.2]
  def up
    ActiveRecord::Base.logger = Logger.new(STDOUT)
    items_from_file = YAML.load_file('db/assets/items.yaml')
    items_from_file.each do |features|
      DefaultItem.create(features).save!
    end
  end

  def down
    DefaultItem.delete_all
  end
end
