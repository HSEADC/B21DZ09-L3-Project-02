Rails.application.routes.draw do
  
  resources :artists do
    resources :issues do
      resources :posts
    end
  end

  get 'welcome/index'
  get 'welcome/about'
  root 'artists#index'
  
end
