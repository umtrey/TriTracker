class PagesController < ApplicationController
  before_action :authenticate_user!, only: [:home]

  def index
    redirect_to(action: :home, status: :found) if user_signed_in?
  end

  def home
  end
end
