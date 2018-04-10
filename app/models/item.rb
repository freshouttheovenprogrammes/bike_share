class Item < ApplicationRecord
  validates_presence_of :title, :description, :price, :status
  
  has_many :orders, through: :order_items



end
