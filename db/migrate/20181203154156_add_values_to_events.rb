class AddValuesToEvents < ActiveRecord::Migration[5.2]
  def up
    events_from_file = YAML.load_file('db/assets/events.yaml')
    events_from_file.each do |features|
      Event.create(features)
    end
  end

  def down
    Event.delete_all
  end
end
