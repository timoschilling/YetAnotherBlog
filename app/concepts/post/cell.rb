class Post::Cell < ApplicationConcept
  class Index < Post::Cell
    def show
      render view: :index
    end

    def count
      options[:count]
    end
  end

  class Show < Post::Cell
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
end
