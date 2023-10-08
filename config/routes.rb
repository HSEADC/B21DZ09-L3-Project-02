Rails.application.routes.draw do
  resources :posts do
    resources :comments
  end
  # Define your application routes per the DSL in https://guides.rubyonrails.org/routing.html

  # Defines the root path route ("/")
  get 'home/index'
  get 'home/about'
  root 'home#index'
end
