class UsersController < ApplicationController
  before_action :require_login, only: %i[index show edit update destroy]
  before_action :set_user, only: %i[show edit update destroy]
  before_action :correct_user, only: %i[edit update destroy]
  before_action :logout_guest_user, only: :new
  before_action :rejct_guest_user, only: %i[edit update]

  # GET /users
  def index
    @users = User.all
  end

  # GET /users/1
  def show
    @user_predicts = @user.pro_game_predicts.where(created_at: Time.current.ago(2.days).beginning_of_day..Time.current)
  end

  # GET /users/new
  def new
    @user = User.new
  end

  # GET /users/1/edit
  def edit; end

  # POST /users
  def create
    @user = User.new(user_params)

    if @user.save
      auto_login(@user)
      redirect_to user_url(@user), success: t('.success')
    else
      render :new, status: :unprocessable_entity
    end
  end

  # PATCH/PUT /users/1
  def update
    if @user.update(user_params)
      redirect_to user_url(@user), success: t('.success')
    else
      render :edit, status: :unprocessable_entity
    end
  end

  # DELETE /users/1
  def destroy
    @user.destroy
    redirect_to root_path, success: t('.danger')
  end

  private

  # Use callbacks to share common setup or constraints between actions.
  def set_user
    @user = User.find(params[:id])
  end

  # Only allow a list of trusted parameters through.
  def user_params
    params.require(:user).permit(:profile, :profile_cache, :nickname, :email, :password, :password_confirmation)
  end

  def correct_user
    redirect_back fallback_location: chatroom_path(Date.today), danger: I18n.t('users.correct_user.danger') if @user != current_user
  end

  def rejct_guest_user
    redirect_back fallback_location: chatroom_path(Date.today), danger: t('users.reject_guest_user.danger') if current_user.guest?
  end
end
