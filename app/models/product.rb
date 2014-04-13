class Product < ActiveRecord::Base
	has_many :line_items
	has_many :orders, through: :line_item
	
	validates :name,:creation_date, :stock, :price, presence: true
	validates :name, uniqueness: true
	validates :price, numericality: true #decimal
	validates :stock, numericality: { only_integer: true }
	
	validates :category, inclusion: { in: %w(libros música&peliculas electrónica hogar juquetes ropa comestibles)}, allow_blank: true
end
