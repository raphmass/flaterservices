Rails.application.routes.draw do
  resources :tasks, only: [:index, :show, :new, :edit, :create, :update] do
    resources :assignments, only: [ :index, :new, :create ]
  end
  resources :assignments, only: [ :show, :edit, :update, :destroy ]  do
  	member do
  	patch 'valid'
  	patch 'reject'
  	end
  end
  get 'my-tasks', to: 'tasks#mytasks'
  devise_for :users
  root to: 'pages#home'
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end