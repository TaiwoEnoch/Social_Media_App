Rails.application.routes.draw do
  root 'users#index'
  resources :users, only: [:index, :show] do
    resources :posts, only: [:index, :show]
    get '/comments', to: 'comments#index'
  end
  resources :posts
end
