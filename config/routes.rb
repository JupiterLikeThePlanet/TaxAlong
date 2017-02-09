Rails.application.routes.draw do
  
  root 'welcome#index'
  resources :welcome, only: [:index]
  resources :about, only: [:index]
  resources :users, except: [:index] do
    resources :shift
  end
    post '/users/new' => 'users#create'
  resources :expense
  get '/login' => 'sessions#new'
  post '/login' => 'sessions#create'
  delete '/logout' => 'sessions#destroy'


  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end
