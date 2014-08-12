require 'mailchimp'

class ApplicationController < ActionController::Base
  include Monban::ControllerHelpers
  # Prevent CSRF attacks by raising an exception.
  # For APIs, you may want to use :null_session instead.
  protect_from_forgery with: :exception

  before_action :setup_mcapi

  def setup_mcapi
    @mc = Mailchimp::API.new(ENV['MC_KEY'])
    @list_id = ENV['MC_ID'] 
  end

  def verify_admin
    if !current_user.admin?
      redirect_to root_path
    end
  end
end
