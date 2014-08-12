class ApplicationController < ActionController::Base
  include Monban::ControllerHelpers
  # Prevent CSRF attacks by raising an exception.
  # For APIs, you may want to use :null_session instead.
  protect_from_forgery with: :exception

  def verify_admin
    if !current_user.admin?
      redirect_to root_path
    end
  end
end
