class AddCategoriesToItems < ActiveRecord::Migration[5.1]
  def change
    add_reference :items, :categories, foreign_key: true
  end
end
