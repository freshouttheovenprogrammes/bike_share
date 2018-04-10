class CreateItems < ActiveRecord::Migration[5.1]
  def change
    create_table :items do |t|
      t.string :title
      t.string :description
      t.integer :price
      t.string :image
      t.string :status, default: "active"
      t.string :quantity 

      t.timestamps
    end
  end
end
