json.array!(@reservations) do |reservation|
  json.extract! reservation, :id, :customer_id, :date, :time, :party, :request
  json.url reservation_url(reservation, format: :json)
end
