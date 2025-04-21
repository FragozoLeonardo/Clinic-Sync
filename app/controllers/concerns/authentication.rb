module Authentication
  extend ActiveSupport::Concern

  included do
    helper_method :current_user, :user_signed_in?
    before_action :authenticate_user
  end

  class_methods do
    def allow_unauthenticated_access(only: [])
      skip_before_action :authenticate_user, only: only
    end
  end

  def current_user
    Current.user ||= session[:user_id] && User.find_by(id: session[:user_id])
  end

  def user_signed_in?
    current_user.present?
  end

  def start_new_session_for(user)
    session[:user_id] = user.id
    Current.user = user
  end

  def terminate_session
    session.delete(:user_id)
    Current.user = nil
  end

  private

  def authenticate_user
    redirect_to new_session_path, alert: "Please sign in." unless user_signed_in?
  end
end
