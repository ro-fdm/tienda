class Producto < ActiveRecord::Base
	has_many :line_items
	has_many :pedidos, through: :line_item	
end
