class PatientsController < ApplicationController
  before_action :require_patient

  def home
  end

  private

  def require_patient
    unless user_signed_in? && AuthorizeUser.call(current_user, Patient)
      redirect_to root_path, alert: "You are not authorized to access this page."
    end
  end
end
