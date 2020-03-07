Rails.application.routes.draw do
  root 'welcome#home'
  get '/signup', :to => 'users#new'
  get '/login', :to => 'sessions#new'
  post '/login', :to => 'sessions#create'
  get '/logout', :to => 'sessions#destroy'  
  get '/studioindex', :to => 'studios#index_all'
  get '/reviewindex', :to => 'reviews#index_all'
  get '/reviewed', :to => 'studios#reviewed'
  get '/five_stars', :to => 'studios#five_stars'
  match '/auth/github/callback', to: 'sessions#create', via: [:get, :post]
  
  resources :reviews
  resources :studios do
    resources :users 
    resources :reviews
  end
  resources :users do 
    resources :studios 
    resources :reviews
  end
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end
