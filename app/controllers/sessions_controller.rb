class SessionsController < ApplicationController
  allow_unauthenticated_access only: %i[ new create ]
  rate_limit to: 10, within: 3.minutes, only: :create, with: -> { redirect_to new_session_url, alert: "Try again later." }

  def create
  user = AuthenticateUser.call(params[:email], params[:password])

  if user
    start_new_session_for user
    redirect_to home_path_for(user), notice: "Logged in successfully."
  else
    redirect_to new_session_path, alert: "Try another email address or password."
  end
end

  def destroy
    terminate_session
    redirect_to new_session_path, notice: "You have been logged out."
  end

private

def home_path_for(user)
  case user
  when Admin
    admins_home_path
  when Doctor
    doctors_home_path
  when Secretary
    secretaries_home_path
  when Patient
    patients_home_path
  else
    root_path
  end
end
end
