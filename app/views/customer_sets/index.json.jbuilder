json.array!(@customer_sets) do |customer_set|
  json.extract! customer_set, :id, :name, :rule
  json.url customer_set_url(customer_set, format: :json)
end
