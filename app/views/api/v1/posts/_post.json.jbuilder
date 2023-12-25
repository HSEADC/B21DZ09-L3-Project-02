json.extract! post, :id, :name, :type, :description, :body, :issue_id, :created_at, :updated_at, :tag_list
json.post_image request.base_url + post.post_image.url
json.url api_v1_post_url(post, format: :json)
