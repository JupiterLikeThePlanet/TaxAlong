Rails.application.routes.draw do
  
  root 'welcome#index'
  resources :welcome, only: [:index]
  resources :about, only: [:index]
  resources :users, except: [:index]
  resources :shift
  resources :expense
  

  # get 'expense/index'

  # get 'expense/show'

  # get 'expense/new'

  # get 'expense/create'

  # get 'expense/update'

  # get 'expense/destroy'

  # get 'shift/index'

  # get 'shift/show'

  # get 'shift/new'

  # get 'shift/create'

  # get 'shift/update'

  # get 'shift/destroy'

  # get 'user/show'

  # get 'user/index'

  # get 'user/new'

  # get 'user/create'

  # get 'user/destroy'

  # get 'user/update'

  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end
