json.extract! issue, :id, :name, :description, :artist_id, :created_at, :updated_at
json.post_image request.base_url + issue.post_image.url
json.url api_v1_issue_url(issue, format: :json)
