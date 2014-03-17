class Pedido < ActiveRecord::Base
	has_many :line_items
	has_many :productos, through: :line_item
end
