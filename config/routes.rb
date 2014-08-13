require "monban/constraints/signed_in"
require "monban/constraints/signed_out"

Rails.application.routes.draw do
  constraints Monban::Constraints::SignedIn.new do
    root "dashboards#show", as: :dashboard 
  end

  constraints Monban::Constraints::SignedOut.new do
    root "homes#show"
  end

  post 'newsletter/subscribe' => 'newsletter#subscribe'

  resource :session, only: [:new, :create, :destroy]
  resources :users, only: [:new, :create]
  resources :bourbons, only: [:new, :create, :show, :index]
  resource :dashboard, only: [:show]
  resources :subscriptions

end
