Rails.application.routes.draw do
  root 'static#home'

  resources :authors, only: [:index, :show]
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end
