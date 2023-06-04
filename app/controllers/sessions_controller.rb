class SessionsController < ApplicationController
  def new
  end

  def create
    @user = User.find_by({ "email" => params["email"] })
    if @user
    
    #may need to redirect somewhere else depending on what the login page is
    else
      redirect_to "/sessions/new"

    
  end

  def destroy
  end
end
  