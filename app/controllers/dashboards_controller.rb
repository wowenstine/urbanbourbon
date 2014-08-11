class DashboardsController < ApplicationController

  def show
    @user = User.new
  end
end
