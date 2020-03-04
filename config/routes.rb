Rails.application.routes.draw do
  root :to => 'welcome#home'
  get '/signup' => 'users#new'
    
  
  resources :reviews
  resources :studios
  resources :users
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end
