class LineItem < ActiveRecord::Base
  belongs_to :product
  belongs_to :order
    	
	validates :product_id, :quantity, :price,  presence: true
	
	validates :quantity, numericality: { only_integer: true }#because is a integer
  validates :price, numericality: true #because is a decimal
  
  before_save :price_order
  after_save :stock_update
  
  private
  
  def price_order
  	self.price = product.price
  end


  def stock_update
    product.stock = product.stock - self.quantity
  end
 
  def cost
    quantity * price
  end
end
