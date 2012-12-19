class PostsController < ApplicationController
  def index
  	@posts = Post.all
  end

  def show
  	@post = Post.find(params[:id])
    @comment = Comment.new
  end

  def new
  	@post = Post.new
  end

  def create
  	@post = Post.new(params[:post])
    if @post.save
      redirect_to @post, notice: "Post created successfully."
    else
      flash[:alert] = "Error: " + @post.errors.full_messages.to_sentence
      render 'new'
    end
  end

end
