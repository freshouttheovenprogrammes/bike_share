class ChangeColumnName < ActiveRecord::Migration[5.1]
  def change
    rename_column :items, :categories_id, :category_id
  end
end
