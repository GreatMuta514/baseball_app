class ApplicationController < ActionController::Base
  add_flash_types :success, :info, :warning, :danger

  def not_authenticated
    redirect_to login_url, warning: I18n.t('all.alert')
  end
end
