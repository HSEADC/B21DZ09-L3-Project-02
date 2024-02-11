Rails.application.routes.draw do

  post 'support/request_support'

  mount LetterOpenerWeb::Engine, at: "letter_opener" if Rails.env.development?

namespace :api do
  namespace :v1 do
    resources :artists, defaults: { format: :json }
    resources :issues, defaults: { format: :json }
    resources :posts, defaults: { format: :json }
    resources :comments, defaults: { format: :json }

    devise_scope :user do
      post "sign_in", to: "sessions#create"
      post "sign_out", to: "sessions#destroy"
    end
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

resources :posts, only: [:new, :create, :destroy, :edit, :show] do
  

  collection do
    get "by_tag/:tag", to: "posts#by_tag", as: "tagged"
  end
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

  get 'welcome/support'
  get 'welcome/index'
  get 'welcome/about'
  root 'welcome#index'
  
end
