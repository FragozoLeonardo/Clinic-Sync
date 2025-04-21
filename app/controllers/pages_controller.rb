class PagesController < ApplicationController
  skip_before_action :authenticate_user, only: :home

  def home
    render plain: "Welcome to the homepage!"
  end
end
