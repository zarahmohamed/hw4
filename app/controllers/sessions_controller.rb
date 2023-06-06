class SessionsController < ApplicationController

  def new
  end

  def create
    @user = User.find_by({ "email" => params["email"] })
    if @user
      if BCrypt::Password.new(@user["password"]) == params["password"]
        session["user_id"] = @user["id"]
        flash["notice"] = "You are logged in!"
        redirect_to "/places"
      else
        flash["notice"] = "Login failed, please try a different username/password"
        redirect_to "/sessions/new"
      end
    else
      flash["notice"] = "Login failed, please try a different username/password"
      redirect_to "/sessions/new"
    end
  end

  def destroy
    flash["notice"] = "You have been logged out."
    session["user_id"] = nil
    redirect_to "/login"
  end
  
end
  