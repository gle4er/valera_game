class DefaultItem < ApplicationRecord
  before_create do
    self.attributes.each do |attr_name, attr_value|
      if attr_value == nil
        self.send(attr_name + '=', 0)
      end
    end
  end
end
