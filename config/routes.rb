Rails.application.routes.draw do
  devise_for :users

  resources :posts do
    resources :comments
  end
  resources :users do #, only: [:index]
    member do
      get :following, :followers
    end
  end

  resources :relationships,       only: [:create, :destroy]
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
end
