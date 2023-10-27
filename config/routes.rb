Rails.application.routes.draw do
  resources :subscriptions
  devise_for :users
  
  resources :artists do
    resources :issues do
      resources :posts do
        resources :comments
      end
    end
  end

  get 'welcome/index'
  get 'welcome/about'
  root 'welcome#index'
  
end
