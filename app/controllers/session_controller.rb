class SessionController < ApplicationController

  def new
  end

  def create

    #1. Check if email address is in the 'users' table
    user = User.find_by email: params[:email]

    #2. Did we find user with that email address (or was it nil), and if we did find user, is the password correct? Present means not nil, not empty. If both conditions are true then credentials are correct
    if user.present? && user.authenticate(params[:password])
      session[:user_id] = user.id

      redirect_to home_path

    # either user is nil or password doesn't match
    else
      flash[:error] = 'Invalid email or password'
      redirect_to login_path
    end # login check

  end # create

  def destroy
    session[:user_id] = nil
    redirect_to login_path
  end # destroy

end
