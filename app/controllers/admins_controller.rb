class AdminsController < ApplicationController
  before_action :require_admin

  def home
  end

  private

  def require_admin
    unless user_signed_in? && current_user.is_a?(Admin)
      redirect_to root_path, alert: "You are not authorized to access this page."
    end
  end
end
