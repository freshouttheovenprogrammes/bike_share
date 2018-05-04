class AddUserToOrder < ActiveRecord::Migration[5.1]
  def change
    add_reference :orders, :user, foreign_key: true, index: true
  end
end
