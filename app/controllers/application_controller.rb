class ApplicationController < ActionController::Base
  protect_from_forgery
  include SessionsHelper

  def check_logged_in
    unless sign_in?
      redirect_to signin_path
    end
  end
end
