class UserSessionsController < ApplicationController
  
  def new
  end

  def create
    @user = login(params[:email], params[:password])
    if @user
      redirect_back_or_to(:users, success: 'Login successful')
    else
      flash.now[:danger] = 'Login failed'
      render action: 'new'
    end
  end

  def destroy
    logout
    redirect_to(:users, success: 'Logged successful')
  end
end