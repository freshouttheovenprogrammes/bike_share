class Order < ApplicationRecord
  validates_presence_of :total, :status
  
  has_many :items, through: :order_items

end
