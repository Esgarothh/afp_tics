Rails.application.routes.draw do
  get 'pablo/index'
  resources :datos
  get 'inicio/index'
  get 'pablo/datos'
  get 'main/pagina2'
  get 'main/pagina3'
  root 'pablo#index'
  #root 'inicio#index'
  get 'main/index'
  post 'main/index'
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
end
