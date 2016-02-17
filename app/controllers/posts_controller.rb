class PostsController < ApplicationController
  def index
    post_count = posts = nil

    ms = Benchmark.ms do
      query = Post.all.includes(:user, comments: [:user]).limit(100)
      post_count = query.count
      posts = query.to_a
    end
    puts "DB Queries: %0.2fms" % ms

    self.response_body = concept("layout/cell", concept("post/cell/index", posts, count: post_count).(:index)).(:application)
  end
end
