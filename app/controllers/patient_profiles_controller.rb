class PatientProfilesController < ApplicationController
  before_action :require_secretary
  before_action :set_patient_profile, only: %i[show edit update destroy]

  def index
    @patient_profiles = PatientProfile.includes(:user)
  end

  def show
  end

  def new
    @patient = Patient.new
    @patient.build_patient_profile
  end

  def create
    @patient = Patient.new(patient_params)
    if @patient.save
      redirect_to patient_profile_path(@patient.patient_profile), notice: "Patient created successfully."
    else
      render :new, status: :unprocessable_entity
    end
  end

  def edit
    @patient = @patient_profile.user
  end

  def update
    @patient = @patient_profile.user
    if @patient.update(patient_params)
      redirect_to patient_profile_path(@patient_profile), notice: "Patient updated successfully."
    else
      render :edit, status: :unprocessable_entity
    end
  end

  def destroy
    @patient_profile.user.destroy
    redirect_to patient_profiles_path, notice: "Patient deleted successfully."
  end

  private

  def set_patient_profile
    @patient_profile = PatientProfile.find(params[:id])
  end

  def patient_params
    params.require(:patient).permit(
      :email,
      :password,
      :password_confirmation,
      patient_profile_attributes: %i[full_name cpf phone birth_date]
    )
  end

  def require_secretary
  unless user_signed_in? && AuthorizeUser.call(current_user, Secretary)
      redirect_to root_path, alert: "You are not authorized to access this page."
  end
  end
end
