class PostsController < ApplicationController
  def index
    post_count = posts = nil

    ms = Benchmark.ms do
      query = Post.all.includes(:user, comments: [:user]).limit(100)
      post_count = query.count
      posts = query.to_a
    end

    content = concept("post/cell/index", posts, count: post_count).(:index)
    self.response_body = concept("layout/cell", content).(:application)

    puts "DB Queries: %0.2fms" % ms
  end
end
