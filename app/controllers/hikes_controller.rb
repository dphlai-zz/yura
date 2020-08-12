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
  end

  def show
  end

  def edit
  end

  private

  def hike_params
    params.require(:hike).permit(:name, :title)
  end

end
