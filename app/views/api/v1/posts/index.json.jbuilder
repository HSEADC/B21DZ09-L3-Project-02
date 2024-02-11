json.set! :jti, User.find_by_email("admin@email.com").jti

json.set! :posts do
    json.array! @posts, partial: "api/v1/posts/post", as: :post
end
