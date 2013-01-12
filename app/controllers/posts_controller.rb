class PostsController < ApplicationController
  before_filter :require_user, only: [:new, :create] 

  def index
  	@posts = Post.order('created_at desc').limit(50).sort
  end

  def show
  	@post = Post.find(params[:id])
    @comment = Comment.new
    @vote = Vote.new
  end

  def new
  	@post = Post.new
  end

  def create
  	@post = Post.new(params[:post])
    @post.user = current_user
    if @post.save
      redirect_to @post
    else
      flash[:alert] = "Your post could not be saved: " + @post.errors.full_messages.to_sentence
      render 'new'
    end
  end
end
