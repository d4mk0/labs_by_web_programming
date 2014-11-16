json.array!(@posts) do |post|
  json.extract! post, :id, :title, :text, :show_at, :is_published
  json.url post_url(post, format: :json)
end
