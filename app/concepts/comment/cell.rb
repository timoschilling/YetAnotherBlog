class Comment::Cell < ApplicationConcept
  property :user
  property :content
  property :created_at

  def show
    render view: :show
  end

  def created_at
    super.strftime("%d.%m.%Y")
  end
end
