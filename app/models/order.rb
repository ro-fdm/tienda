class Order < ActiveRecord::Base
	has_many :line_items
	has_many :products, through: :line_item
	accepts_nested_attributes_for :line_items, :allow_destroy => true
end
