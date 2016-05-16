json.array!(@usermaps) do |usermap|
  json.extract! usermap, :id, :title, :description, :address, :latitude, :longitude
  json.url usermap_url(usermap, format: :json)
end
