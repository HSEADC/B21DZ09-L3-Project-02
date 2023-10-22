Rails.application.routes.draw do
  
  resources :artists do
    resources :issues
  end

  get 'artists/index'
  root 'artists#index'
  
end
