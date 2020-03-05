Rails.application.routes.draw do
  root :to => 'welcome#home'
  get '/signup', :to => 'users#new'
  get '/login', :to => 'sessions#new'
  post '/login', :to => 'sessions#create'
  get '/logout', :to => 'sessions#destroy'  
  
  resources :reviews
  resources :studios do
    resources :users 
  end
  resources :users do 
    resources :studios 
    resources :reviews
  end
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end
