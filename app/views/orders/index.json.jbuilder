json.array!(@orders) do |order|
  json.extract! order, :id, :customer_id, :order_detail
  json.url order_url(order, format: :json)
end
