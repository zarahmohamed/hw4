class SessionsController < ApplicationController
  def new
  end

  def create
    @user = User.find_by({ "email" => params["email"] })
    if @user
      password_the_user_typed = params["password"]
      password_in_the_database = @user["password"]
      if BCrypt::Password.new(password_in_the_database) == password_the_user_typed 
        flash["notice"] = "You are logged in!"
        redirect_to "/sessions"
      #may need to redirect somewhere else depending on what the login page is
      else
        flash["notice"] = "Login failed"
        redirect_to "/sessions/new"
      end
    else
      flash["notice"] = "Login failed"
      redirect_to "/sessions/new"
    end
  end

  def destroy
  end
end
  