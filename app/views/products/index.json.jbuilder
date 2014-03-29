json.array!(@productos) do |producto|
  json.extract! producto, :id, :nombre, :descripcion, :fecha_alta, :fabricante, :cantidad_almacen, :categoria
  json.url producto_url(producto, format: :json)
end
