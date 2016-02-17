class Post::Cell < ApplicationConcept
  class Index < Post::Cell
    register :index

    def count
      options[:count]
    end
  end

  class Show < Post::Cell
    register :preview
    property :id
    property :headline
    property :user
    property :created_at
    property :comments

    def created_at
      super.strftime("%d.%m.%Y")
    end

    def first_comment
      comments.first
    end

    def url
      "/posts/#{id}"
    end
  end
end
