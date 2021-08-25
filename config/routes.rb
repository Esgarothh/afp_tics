Rails.application.routes.draw do
  get 'pablo/index'
  resources :datos
  get 'inicio/index'
  get 'pablo/datos'

  root 'pablo#index'
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
end
