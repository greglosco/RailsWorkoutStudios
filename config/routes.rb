Rails.application.routes.draw do
  root :to => 'welcome#home'
  get '/signup', :to => 'users#new'
  get '/login', :to => 'sessions#new'
  post '/login', :to => 'sessions#create'
  get '/logout', :to => 'sessions#destroy'  
  
  resources :reviews
  resources :studios
  resources :users do 
    resources :studios 
  end
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end
