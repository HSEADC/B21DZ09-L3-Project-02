Rails.application.routes.draw do
  
  resources :artists do
    resources :issues do
      resources :posts
    end
  end

  get 'artists/index'
  root 'artists#index'
  
end
