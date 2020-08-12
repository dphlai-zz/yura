class PostsController < ApplicationController

  before_action :check_if_logged_in, except: [:index, :show]

  def new
    @post = Post.new
    @hike = Hike.find params[:hike_id]
  end # new

  def create
    # raise 'hell'
    @post = Post.new post_params
    @post.user_id = @current_user.id
    @post.save
    if params[:file].present?
      response = Cloudinary::Uploader.upload params[:file]
      Photo.create image: response['public_id'], title: params[:photo_title], post_id: @post.id
    end
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
    raise
    post = Post.find params[:id]
    if post.user != @current_user
      redirect_to posts_path
      return
    end

    post.update post_params
    redirect_to post_path(post.id)
  end # update

  def destroy
    @post = Post.destroy params[:id]
    redirect_to posts_path
  end # destroy

  private

  def post_params
    params.require(:post).permit(:title, :caption, :hike_id)
  end

end
