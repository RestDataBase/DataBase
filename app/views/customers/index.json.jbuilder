json.array!(@customers) do |customer|
  json.extract! customer, :id, :fname, :lname, :street, :city, :state, :zip, :phone, :email
  json.url customer_url(customer, format: :json)
end
