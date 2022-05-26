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
  
  post '/users/:id/follow', to: "users#follow", as: "follow_user"
  post '/users/:id/unfollow', to: "users#unfollow", as: "unfollow_user"
end
