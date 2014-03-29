class LineItem < ActiveRecord::Base
  belongs_to :product
  belongs_to :order
  
  def cost
    quantity * price
  end
end
