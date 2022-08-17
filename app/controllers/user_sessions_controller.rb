class UserSessionsController < ApplicationController
  
  def new
  end

  def create
    @user = login(params[:email], params[:password])
    if @user
      redirect_back_or_to(:chatrooms, success: 'Login successful')
    else
      flash.now[:danger] = 'Login failed'
      render action: 'new'
    end
  end

  def destroy
    logout
    redirect_to(:root, success: 'Logout successful')
  end

  def guest_login
    @guest_user = User.create(
      nickname: 'ゲスト',
      email: SecureRandom.alphanumeric(10) + "@email.com",
      password: 'password',
      password_confirmation: 'password'
      )
    auto_login(@guest_user)
    redirect_back_or_to(:chatrooms, success: 'Login successful')
  end

end