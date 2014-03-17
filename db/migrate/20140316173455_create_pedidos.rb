class CreatePedidos < ActiveRecord::Migration
  def change
    create_table :pedidos do |t|
      t.string :estado
      t.string :medio_pago
      t.text :direccion_envio
      t.string :ciudad_envio
      t.string :nombre_comprador

      t.timestamps
    end
  end
end
