class AddUserToValeras < ActiveRecord::Migration[5.2]
  def change
    add_reference :valeras, :user, foreign_key: true
  end
end
