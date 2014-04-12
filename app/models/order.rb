class Order < ActiveRecord::Base
	has_many :line_items
	has_many :products, through: :line_items
	accepts_nested_attributes_for :line_items, :allow_destroy => true,  reject_if: proc {|atts| atts['quantity'].to_i < 1 || atts['price'].to_i < 1 }
	
	validates :client_name,  presence: true
	validates :ship_address, presence: true
	validates :ship_city, presence: true
	validates :payment_method, presence: true, inclusion: { in: %w(efectivo tarjeta paypal)}
	validates :status, presence: true, inclusion: { in: %w(Pendiente Enviado Recibido)}
end
