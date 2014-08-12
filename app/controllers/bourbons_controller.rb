class BourbonsController < ApplicationController
  before_filter :verify_admin, except: [:show, :index]
  
  def show
    @bourbon = Bourbon.find(params[:id])
  end

  def new
    @bourbon = Bourbon.new(params[:id])
  end

  def create
    @bourbon = Bourbon.create(bourbon_params)
    redirect_to bourbons_path(@bourbon)
  end

  def index
    @bourbons = Bourbon.all
  end

  private

  def bourbon_params
    params.require(:bourbon).permit(:name, :description)
  end

end
