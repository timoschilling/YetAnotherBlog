# api.json.jbuilder
json.posts @posts do |post|
  json.id post.id
  json.created_at post.created_at
  json.headline post.headline
  json.content post.content
  json.partial! 'user', user: post.user
  json.partial! 'comment', comment: post.comments.first
end

# _user.json.jbuilder
json.user do
  json.id user.id
  json.first_name user.first_name
  json.last_name user.last_name
  json.email user.email
end

# _comment.json.jbuilder
json.comment do
  json.id comment.id
  json.created_at comment.created_at
  json.content comment.content
  json.partial! 'user', user: comment.user
end
