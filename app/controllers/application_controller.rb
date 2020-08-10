class ApplicationController < ActionController::Base

  before_action :fetch_user # will cause this method to run in all controller methods

  def fetch_user

    # Check if user_id in the sesion is the id of a real user in our db. If it is, we will get the user object in @current_user; if not, we will get nil
    if session[:user_id].present?
      @current_user = User.find_by id: session[:user_id]
    end

    # If we did get nil from the above query, delete the session because the user_id is stale (invalid)
    if @current_user.nil?
      session[:user_id] = nil # unless @current_user.present?
    end

  end # fetch_user

  def check_if_logged_in
    # If the current browser user is not logged in, this method redirects them to the login page; we can call this method for any specific controller actions that require a user to be logged in, to lock down these routes
    redirect_to login_path unless @current_user.present?
  end # check_if_logged_in

end
