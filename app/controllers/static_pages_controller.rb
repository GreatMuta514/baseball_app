class StaticPagesController < ApplicationController
  before_action :already_logged_in, only: %i[top]
  def top; end

  def terms_of_service; end

  def privacy_policy; end

  private

  def already_logged_in
    redirect_to chatrooms_path if current_user
  end
end
