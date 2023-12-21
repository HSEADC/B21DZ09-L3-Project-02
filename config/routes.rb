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

resources :posts, only: [:new, :create, :destroy] do
  # collection do 
  #   get "new_for_artist", to: "posts#new_for_artist"
  # end
end 

# get "posts/new_for_artist", to: "posts#new_for_artist", as: "new_post_for_artist"



resources :artists do
  resources :issues do
    resources :posts do
      resources :comments
    end
  end
end

  resources :subscriptions, only: [:create, :show]

  devise_for :users

  get 'welcome/covers'
  get 'welcome/promos'
  get 'welcome/videos'

  get 'welcome/index'
  get 'welcome/about'
  root 'welcome#index'
  
end
