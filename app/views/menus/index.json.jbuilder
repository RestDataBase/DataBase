json.array!(@menus) do |menu|
  json.extract! menu, :id, :item_name, :item_quantity, :item_price, :item_select
  json.url menu_url(menu, format: :json)
end
