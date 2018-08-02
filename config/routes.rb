Rails.application.routes.draw do
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
  resources :buildings, only: [:show, :edit, :update, :index]
  resources :companies, only: [:show, :create, :new, :update]
  resources :employees, only: [:destroy]

end
