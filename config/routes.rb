Rails.application.routes.draw do

  root to: 'cocktails#index'
  resources :cocktails, only: [:index, :show, :new, :create, :destroy] do
    resources :doses, only: [:new, :create]
  end

  resources :doses, only: [:destroy]


  # get 'cocktails', to: cocktails#index'
  # get 'cocktails/:id', to: 'cocktails#show'
  # get ''                 , to: 'cocktails#new'
  # post 'cocktails', to: 'cocktails#create'

  # get 'cocktails/:cocktail_id/doses/new'
  # post 'cocktails', to: 'cocktails/:cocktail_id/doses'

  # get
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end
