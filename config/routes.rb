Rails.application.routes.draw do
  root 'static#home'

  get '/login' => 'session#new'
  post '/sessions' => 'session#create'
  delete '/logout' => 'session#destroy'
  get '/register' => 'users#new'

  resources :users, only: [:create, :show] do
    resources :collections, except: [:index, :new, :edit]
  end

  resources :authors, only: [:index, :show]
  resources :manga, except: :destroy
end
