class CreateProductos < ActiveRecord::Migration
  def change
    create_table :productos do |t|
      t.string :nombre
      t.text :descripcion
      t.datetime :fecha_alta
      t.text :fabricante
      t.integer :cantidad_almacen

      t.timestamps
    end
  end
end
