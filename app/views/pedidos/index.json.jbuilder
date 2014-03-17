json.array!(@pedidos) do |pedido|
  json.extract! pedido, :id, :estado, :medio_pago, :direccion_envio, :ciudad_envio, :nombre_comprador
  json.url pedido_url(pedido, format: :json)
end
