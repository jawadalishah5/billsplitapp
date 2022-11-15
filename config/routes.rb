Rails.application.routes.draw do
  root "home#index"
  resources :groups, only: [:new, :create, :index, :show]
  devise_for :users
  # Define your application routes per the DSL in https://guides.rubyonrails.org/routing.html
  devise_scope :user do
    # Redirests signing out users back to sign-in
    get "users", to: "devise/sessions#new"
  end
  # Defines the root path route ("/")
end
