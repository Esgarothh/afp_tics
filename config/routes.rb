Rails.application.routes.draw do
  get 'pablo/index'
  resources :datos
  get 'inicio/index'
  root 'inicio#index'
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
end
