json.array!(@filiks) do |filik|
  json.extract! filik, :id, :name, :size
  json.url filik_url(filik, format: :json)
end
