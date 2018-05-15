Rails.application.routes.draw do
  root 'welcome#home'

  get '/login' => 'session#new'
  post '/sessions' => 'session#create'
  delete '/logout' => 'session#destroy'
  get '/register' => 'users#new'
  get '/auth/facebook/callback' => 'session#facebook'

  resources :users, only: :create do
    resources :collections, only: [:index, :create, :update, :destroy]
  end

  resources :authors, only: [:index, :show] do
    resources :manga, only: :new
  end

  resources :manga, except: :destroy
  resources :publisher, only: [:index, :show]
  
  post '/manga' => 'manga#create', as: 'mangas'
end
