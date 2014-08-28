json.array!(@lists) do |list|
  json.extract! list, :id, :name, :user_id, :sort_order
  json.url list_url(list, format: :json)
end
