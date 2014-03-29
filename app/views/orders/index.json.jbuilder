json.array!(@orders) do |order|
  json.extract! order, :id, :status, :payment_method, :ship_address, :ship_city, :client_name
  json.url order_url(order, format: :json)
end
