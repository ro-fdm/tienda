class EnglishModels < ActiveRecord::Migration
  def change
  
  	remove_index "line_items", ["pedido_id"]
		remove_index "line_items", ["producto_id"]
  	
  	change_table :line_items do |t|
  		t.rename :producto, :product
  		t.rename :cantidad, :quantity
  		t.rename :precio, :price
  		t.rename :producto_id, :product_id
  		t.rename :pedido_id, :order_id
  	end
  	
		add_index "line_items", ["order_id"], name: "index_line_items_on_order_id", using: :btree
		add_index "line_items", ["product_id"], name: "index_line_items_on_product_id", using: :btree
		
		change_table :pedidos do |t|
			t.rename   :estado, :status
		  t.rename   :medio_pago, :payment_method
		  t.rename   :direccion_envio, :ship_address
		  t.rename   :ciudad_envio, :ship_city
		  t.rename   :nombre_comprador, :client_name
		end
		
		rename_table :pedidos, :orders
		
		change_table :productos do |t|
			t.rename   :nombre, :name
		  t.rename   :descripcion, :description
		  t.rename   :fecha_alta, :creation_date
		  t.rename   :fabricante, :maker
		  t.rename   :cantidad_almacen, :stock
		  t.rename   :categoria, :category
		end
		
		rename_table :productos, :products
	 
  end
end
