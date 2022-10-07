class ApplicationController < ActionController::Base
  add_flash_types :success, :info, :warning, :danger

  def not_authenticated
    redirect_to login_url, warning: I18n.t('all.alert')
  end

  def reject_guest
    redirect_back fallback_location: root_path, danger: "ゲストは利用できません、会員登録かログインしてください" if current_user.guest?
  end
end
