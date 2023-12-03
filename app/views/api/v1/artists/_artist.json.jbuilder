json.extract! artist, :id, :name, :description, :created_at, :updated_at
json.post_image request.base_url + artist.post_image.url
json.url api_v1_artist_url(artist, format: :json)
