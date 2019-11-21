Rails.application.routes.draw do
  #root to: 'cocktails#index'
  resources :cocktails, only: [:index, :show, :new, :create]
  # get '/cocktails', to: 'cocktails#index'
  # get 'cocktails/show'
  # get 'cocktails/new'
  # get 'cocktails/create'
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end
