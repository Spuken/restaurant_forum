Rails.application.routes.draw do
  
  #user
  get 'users/:id' => 'users#show' , as: 'sp_user'
  get 'users/:id/edit' => 'users#edit',  as: 'sp_edit_users'
  put 'users/:id' => 'users#update'
  patch 'users/:id' => 'users#update'
  
  devise_for :users

  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
  root "restaurants#index"

  resources :restaurants, only: [:index, :show] do
    # restaurants/:id/comments/
    resources :comments, only: [:create, :destroy]

    # restaurants/feeds
    collection do
      get :feeds
    end

    # restaurants/:id/feeds
    member do
      get :dashboard
    end
  end

  resources :categories, only: :show

  namespace :admin do
    resources :restaurants
    resources :categories
    root "restaurants#index"  
  end

end
