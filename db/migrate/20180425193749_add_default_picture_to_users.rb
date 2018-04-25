class AddDefaultPictureToUsers < ActiveRecord::Migration[5.1]
  def change
    change_column_default :users, :image, "stock-person.jpg"
  end
end
