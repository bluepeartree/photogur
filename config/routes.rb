Rails.application.routes.draw do

  get 'sessions/new' => 'sessions#new'
  post 'sessions/new' => 'sessions#create'
  delete 'sessions' => 'sessions#destroy'

  root 'pictures#index'
  get 'pictures' => 'pictures#index'

  get 'pictures/new' => 'pictures#new'
  post 'pictures'=> 'pictures#create'

  get 'pictures/:id/edit' => 'pictures#edit'
  patch 'pictures/:id' => 'pictures#update'

  delete 'pictures/:id' => "pictures#destroy"

  get 'pictures/:id' => 'pictures#show'

  resource :users


  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end
