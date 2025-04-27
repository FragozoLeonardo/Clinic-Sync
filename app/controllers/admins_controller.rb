class AdminsController < ApplicationController
  before_action :require_admin

  def home
  end

  private

  def require_admin
    unless user_signed_in? && AuthorizeUser.call(current_user, Admin)
      redirect_to root_path, alert: "You are not authorized to access this page."
    end
  end
end
