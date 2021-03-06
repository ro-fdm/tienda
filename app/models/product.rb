class Product < ActiveRecord::Base
	has_many :line_items
	has_many :orders, through: :line_item

	validates :name,:creation_date, :stock, :price, presence: true
	validates :name, uniqueness: true
	validates :price, numericality: true #decimal
	validates :stock, numericality: { only_integer: true }
	
	validates :category, inclusion: { in: %w(libros música&peliculas electrónica hogar juquetes ropa comestibles)}, allow_blank: true

	scope :by_category, ->(category) {where("category like ?", category) unless category.blank?} 
	
	scope :by_stock, -> (stock) {where(stock: stock)  unless stock.blank?}
	
	scope :by_creation_date, -> (creation_date) {where(creation_date: creation_date) unless creation_date.blank?}
	
	scope :by_maker,-> (maker) {where(maker: maker) unless maker.blank?}
	
	scope :min_price, ->(price) {where("price >= ?", price) unless price.blank?}
	scope :max_price, lambda {|price| where("price <= ?", price) unless price.blank?}# lambda = ->, stabby operator
	
	def self.filter(params)
		#self es por si se hereda, y es self = Product
		products = self.by_category(params[:category]) #les vamos pasando cada filtro
		products = products.by_stock(params[:stock])
		products = products.by_creation_date(params[:creation_date])
		products = products.by_maker(params[:maker])
    products.min_price(params[:min_price]).max_price(params[:max_price])
		#no necesito el return ni el igual porqeu siempre se devuelve la ultima linea, salvo retunr incondicional	
	end
end



