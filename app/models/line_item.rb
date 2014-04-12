class LineItem < ActiveRecord::Base
  belongs_to :product
  belongs_to :order
    	
	validates :product_id,  presence: true
	validates :quantity, presence: true
	validates :price, presence: true
	
	validates :quantity, numericality: { only_integer: true }
  validates :price, numericality: { only_integer: true }
  
  def cost
    quantity * price
  end
end
