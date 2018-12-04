class AddUserToValera < ActiveRecord::Migration[5.2]
  def change
    add_reference :valeras, :users, foreign_key: true
  end
end
