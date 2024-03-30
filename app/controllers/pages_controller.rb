class PagesController < ApplicationController
  # before_action :authenticate_user!, only: [:users], unless: :admin_signed_in?
  # before_action :authenticate_admin!, only: [:admin]

  def home
  end
end
