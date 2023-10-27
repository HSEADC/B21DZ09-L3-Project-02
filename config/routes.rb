Rails.application.routes.draw do
namespace :admin do
  resources :artists do
    resources :issues do
      resources :posts do
        resources :comments
      end
    end
  end

  resources :subscriptions
end

  resources :subscriptions, only: [:create, :show]

  devise_for :users

  get 'welcome/index'
  get 'welcome/about'
  root 'welcome#index'
  
end
