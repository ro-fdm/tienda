class Product < ActiveRecord::Base
	has_many :line_items
	has_many :orders, through: :line_item
	
	validates :name,  presence: true
	validates :name, uniqueness: true
	validates :creation_date, presence: true
	validates :stock, presence: true
	validates :price, presence: true
	
	validates :price, numericality: { only_integer: true }
	validates :stock, numericality: { only_integer: true }
	
	validates :category, inclusion: { in: %w(libros música&peliculas electrónica hogar juquetes ropa comestibles)}, allow_nil: true
end
