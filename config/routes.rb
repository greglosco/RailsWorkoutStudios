Rails.application.routes.draw do
  get '/signup' => 'users#new'
  
  
  resources :reviews
  resources :studios
  resources :users
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end
