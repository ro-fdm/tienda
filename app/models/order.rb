class Order < ActiveRecord::Base
	has_many :line_items
	has_many :products, through: :line_items
	accepts_nested_attributes_for :line_items, :allow_destroy => true,  reject_if: proc {|atts| atts['quantity'].to_i < 1 || atts['price'].to_i < 1 }
	
	validates :client_name, :ship_address, :ship_city, :payment_method, :status,  presence: true
	
	validates :payment_method , inclusion: { in: %w(efectivo tarjeta paypal)}
	validates :status , inclusion: { in: %w(Pendiente Enviado Recibido)}
	
	before_save :status_write, on: :create
	
	private
	def status_write
		self.status = "Pendiente"
	end
end
