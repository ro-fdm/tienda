class Order < ActiveRecord::Base
	has_many :line_items
	has_many :products, through: :line_items
	accepts_nested_attributes_for :line_items, :allow_destroy => true,  reject_if: proc {|atts| atts['quantity'].to_i < 1 || atts['price'].to_i < 1 }
end
