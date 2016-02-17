json.comment do
  json.id comment.id
  json.created_at comment.created_at
  json.content comment.content
  json.partial! 'user', user: comment.user
end
