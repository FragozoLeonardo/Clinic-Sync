class SecretariesController < ApplicationController
  before_action :require_secretary

  def home
  end

  private

  def require_secretary
    unless user_signed_in? && AuthorizeUser.call(current_user, Secretary)
      redirect_to root_path, alert: "You are not authorized to access this page."
    end
  end
end
