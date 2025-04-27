class DoctorsController < ApplicationController
  before_action :require_doctor

  def home
  end

  private

  def require_doctor
    unless user_signed_in? &&  AuthorizeUser.call(current_user, Doctor)
      redirect_to root_path, alert: "You are not authorized to access this page."
    end
  end
end
