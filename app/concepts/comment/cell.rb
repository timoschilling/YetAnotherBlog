class Comment::Cell < ApplicationConcept
  register :show
  property :user
  property :content
  property :created_at

  def created_at
    super.strftime("%d.%m.%Y")
  end
end
