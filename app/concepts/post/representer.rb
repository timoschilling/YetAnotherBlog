require 'representable/json'

class Post::Representer < Representable::Decorator
  include Representable::JSON

  class Wrapper < Struct.new(:posts); end

  class User < Representable::Decorator
    include Representable::JSON
    property :id
    property :first_name
    property :last_name
    property :email
  end

  class Comment < Representable::Decorator
    include Representable::JSON
    property :id
    property :created_at
    property :content
    property :user, decorator: User
  end

  collection :posts do
    property :id
    property :created_at
    property :headline
    property :content
    property :user, decorator: User
    property :comment, decorator: Comment, exec_context: :decorator

    def comment
      represented.comments.first
    end
  end
end
