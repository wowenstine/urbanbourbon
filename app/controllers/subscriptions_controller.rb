class SubscriptionsController < ApplicationController
  before_filter :verify_admin, except: [:show, :index]
  
  def show
    @subscription = Subscription.find_by(slug: params[:id])
  end
  
  def new
    @subscription = Subscription.new(params[:id])
  end

  def create
    subscription = Subscription.new(subscription_params)
    subscription.save
    redirect_to subscriptions_path
  end

  def edit
    @subscription = find_subscription
  end

  def update
    subscription = find_subscription
    subscription.update(subscription_params)
    redirect_to subscriptions_path
  end

  def index
    @subscriptions = Subscription.all
  end

  def destroy
    find_subscription.destroy
    redirect_to subscriptions_path
  end

  private
  def find_subscription
    Subscription.find_by(slug: params[:id])
  end

  def subscription_params
    params.require(:subscription).permit(:name, :description)
  end
end
