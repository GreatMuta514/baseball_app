class UserSessionsController < ApplicationController
  before_action :logout_guest_user, only: :new

  def new; end

  def create
    @user = if params[:remember_me] == 'true'
              login(params[:email], params[:password], params[:remember_me])
            else
              login(params[:email], params[:password])
            end
    if @user
      redirect_back_or_to chatroom_path(Date.today), success: t('.success')
    else
      flash.now[:danger] = t('.danger')
      render action: 'new'
    end
  end

  def destroy
    remember_me!
    forget_me!
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
    redirect_back_or_to chatroom_path(Date.today), success: t('.success')
  end
end
