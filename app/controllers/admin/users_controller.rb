module Admin
  class UsersController < ApplicationController
    before_action :reject_not_admin_user
    before_action :set_user, only: %i[show edit update destroy]

    def index
      @users = User.all
    end

    def show; end

    def edit; end

    def update
      if @user.update(user_params)
        redirect_to admin_users_path, success: 'ユーザーを更新しました。'
      else
        flash.now[:danger] = 'ユーザー更新に失敗しました。'
        render 'admin/users/edit'
      end
    end

    def destroy
      @user.destroy
      redirect_to admin_users_path, success: 'ユーザーを削除しました。'
    end

    private

    def set_user
      @user = User.find(params[:id])
    end

    def user_params
      params.require(:user).permit(:profile_cache, :nickname, :email)
    end

    def reject_not_admin_user
      redirect_to root_path, success: '権限がありません。' unless current_user.role_before_type_cast == 2
    end
  end
end
