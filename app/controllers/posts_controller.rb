class PostsController < ApplicationController

  before_action :check_if_logged_in, except: [:index, :show]

  def new
    @post = Post.new
  end # new

  def create
    @post = Post.new post_params
    @post.user_id = @current_user.id
    @post.save
    redirect_to posts_path
  end # create

  def index
    @posts = Post.all.order :title
  end # index

  def show
    @post = Post.find params[:id]
  end # show

  def edit
    @post = Post.find params[:id]
    redirect_to posts_path unless @post.user == @current_user
  end # edit

  def update
    post = Post.find params[:id]
    if post.user != @current_user
      redirect_to posts_path
      return
    end

    post.update post_params
    redirect_to post_path(post.id)
  end # update

  def destroy
  end # destroy

  private

  def post_params
    params.require(:post).permit(:title, :caption)
  end

end
