Rails.application.routes.draw do
  root 'static#home'

  get '/login' => 'session#new'
  post '/sessions' => 'session#create'
  delete '/logout' => 'session#destroy'
  get '/register' => 'users#new'
  get '/auth/facebook/callback' => 'session#facebook'

  resources :users, only: [:create, :show] do
    resources :collections, only: [:create, :update, :destroy]
  end

  resources :authors, only: [:index, :show]
  resources :manga, except: :destroy
  post '/manga' => 'manga#create', as: 'mangas'
end
