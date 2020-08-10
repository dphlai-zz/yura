class UsersController < ApplicationController
  def new
    @user = User.new
  end # new

  def create
    @user = User.create user_params

    # check whether the above create was successful, i.e. created a row in the uers table, therefore object has id, or if it failed due to data validation error
    if @user.persisted?
      session[:user_id] = @user.id # log in the newly created account automatically
      redirect_to root_path
    else
      # show form again, no redirect
      render :new
    end

  end # create

  private
  
  def user_params
    params.require(:user).permit(:name, :email, :password, :password_confirmation)
  end # user_params

end
