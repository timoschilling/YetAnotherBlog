class PostsController < ApplicationController
  def index
    ms = Benchmark.ms do
      posts = Post.all.includes(:user, comments: [:user]).limit(100)
      @post_count = posts.count
      @posts = posts.to_a
    end
    puts "DB Queries: %0.2fms" % ms
  end
end
