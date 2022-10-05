class UserSessionsController < ApplicationController
  def new; end

  def create
    @user = login(params[:email], params[:password])
    if @user
      redirect_back_or_to chatroom_path(Date.today), success: t('.success')
    else
      flash.now[:danger] = t('.danger')
      render action: 'new'
    end
  end

  def destroy
    logout
    redirect_to(:root, success: t('.success'))
  end

  def guest_login
    @guest_user = User.create(
      nickname: 'ゲスト',
      email: SecureRandom.alphanumeric(10) + '@email.com',
      password: 'password',
      password_confirmation: 'password',
      role: 'guest'
    )
    auto_login(@guest_user)
    redirect_back_or_to(:chatrooms, success: t('.success'))
  end
end
