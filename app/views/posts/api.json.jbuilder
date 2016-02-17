# api.json.jbuilder
json.posts @posts do |post|
  json.id post.id
  json.created_at post.created_at
  json.headline post.headline
  json.content post.content
  json.partial! 'user', user: post.user
  json.partial! 'comment', comment: post.comments.first
end
