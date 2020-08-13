class HikesController < ApplicationController

  before_action :check_if_logged_in, except: [:index, :show]

  def new
    @hike = Hike.new
  end

  def create
    @hike = Hike.new hike_params
    @hike.user_id = @current_user.id
    @hike.save
    redirect_to hikes_path
  end

  def index
    @hikes_without_posts = Hike.left_joins(:posts).where(posts:{id: nil})
    @hikes = Post.all.group_by(&:hike)
  end

  def show
    # @hikes = Post.all.group_by(&:hike)
    @hike = Hike.find params[:id]
  end

  def edit
    @hike = Hike.find params[:id]
    redirect_to hikes_path unless @hike.user == @current_user
  end

  def update
    hike = Hike.find params[:id]
    if hike.user != @current_user
      redirect_to hikes_path
      return
    end

    hike.update hike_params
    redirect_to hike_path(hike.id)
  end # update

  def destroy
    @hike = Hike.destroy params[:id]
    redirect_to hikes_path
  end

  private

  def hike_params
    params.require(:hike).permit(:name, :description)
  end

end
