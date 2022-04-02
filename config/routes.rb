Rails.application.routes.draw do
  devise_for :users
  resources :users
  
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
  get 'introduce/index' => 'introduce#index'
  root 'introduce#index'
  get 'introduce/show' => 'introduce#show'
  
  resources :musicpresents do
  resources :likes, only: [:create, :destroy]
  resources :comments, only: [:create, :destroy]
  end


  resources :sportspresents do
  resources :sportslikes, only: [:create, :destroy]
  resources :sportscomments, only: [:create, :destroy]
  end

  resources :moviepresents do
  resources :movielikes, only: [:create, :destroy]
  resources :moviecomments, only: [:create, :destroy]
  end
  
  resources :sweetspresents do
  resources :sweetslikes, only: [:create, :destroy]
  resources :sweetscomments, only: [:create, :destroy]
  end

  resources :skillpresents do
  resources :skilllikes, only: [:create, :destroy]
  resources :skillcomments, only: [:create, :destroy]
  end

  resources :relaxpresents do
  resources :relaxlikes, only: [:create, :destroy]
  resources :relaxcomments, only: [:create, :destroy]
  end
  
end
