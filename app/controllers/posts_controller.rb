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

  def api
    posts = nil

    ms_db = Benchmark.ms do
      posts = Post.all.includes(:user, comments: [:user]).limit(100).to_a
    end

    json = nil

    ms_json = Benchmark.ms do
      representer = Post::Representer.new(Post::Representer::Wrapper.new(posts))
      json = representer.to_json
    end

    # response.format 'application/json'
    response.headers["Content-Type"] = "application/json"
    self.response_body = json

    puts "DB Queries: %0.2fms" % ms_db
    puts "JSON: %0.2fms" % ms_json
  end
end
