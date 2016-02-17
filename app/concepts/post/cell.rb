class Post::Cell < ApplicationConcept
  property :headline
  property :user
  property :created_at
  property :comments

  def preview
    render view: :preview
  end

  def created_at
    super.strftime("%d.%m.%Y")
  end

  def first_comment
    comments.first
  end
end
