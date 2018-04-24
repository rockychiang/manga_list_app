Rails.application.routes.draw do
  root 'static#home'

  get '/login' => 'session#new'
  post '/sessions' => 'session#create'
  delete '/logout' => 'session#destroy'

  resources :authors, only: [:index, :show]
end
