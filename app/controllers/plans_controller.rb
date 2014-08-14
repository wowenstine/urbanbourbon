class PlansController < ApplicationController

  def show
    @plan = Plan.new
  end
end
