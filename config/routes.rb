Inout::Application.routes.draw do
  devise_for :users  
  
  resources :status_changes, only: [:create]
  match '/board', to: 'status_changes#board'
  match '/log', to: 'status_changes#log'
  
  root :to => 'home#index'
end
