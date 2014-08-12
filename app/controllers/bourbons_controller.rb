class BourbonsController < ApplicationController
  before_filter :verify_admin, except: [:show, :index]
  
  def show
    @bourbon = find_bourbon
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

  def find_bourbon
    Bourbon.find_by(slug: params[:id])
  end

  def bourbon_params
    params.require(:bourbon).permit(:name, :description, :image)
  end
end
