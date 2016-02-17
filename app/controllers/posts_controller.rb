class PostsController < ApplicationController
  def index
    @posts = Post.all.includes(:user, comments: [:user]).limit(100)
  end
end
