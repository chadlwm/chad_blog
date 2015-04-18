json.array!(@posts) do |post|
  json.extract! post, :id, :title, :raw_content, :html_content
  json.url post_url(post, format: :json)
end
