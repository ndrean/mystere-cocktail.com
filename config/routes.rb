Rails.application.routes.draw do

  root to: 'cocktails#index'
  resources :cocktails, only: [:new, :show, :create, :destroy] do
    resources :doses, only: [:create]
  end

  resources :doses, only: [:destroy]

  # get 'cocktails', to: cocktails#index' OK
  # get 'cocktails/:id', to: 'cocktails#show' RIEN
  # get ''                 , to: 'cocktails#new' OK
  # post 'cocktails', to: 'cocktails#create' OK

  # get 'cocktails/:cocktail_id/doses/new'
  # post 'cocktails', to: 'cocktails/:cocktail_id/doses'

  # get
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end
