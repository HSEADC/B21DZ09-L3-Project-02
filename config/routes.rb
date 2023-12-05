Rails.application.routes.draw do
namespace :api do
  namespace :v1 do
    resources :artists, defaults: { format: :json }
    resources :issues, defaults: { format: :json }
    resources :posts, defaults: { format: :json }
    resources :comments, defaults: { format: :json }
  end
end



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
  get 'welcome/feed'
  root 'welcome#index'
  
end
