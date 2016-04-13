json.array!(@restaurants) do |restaurant|
  json.extract! restaurant, :id, :name, :street, :city, :state, :zip, :phone, :website
  json.url restaurant_url(restaurant, format: :json)
end
