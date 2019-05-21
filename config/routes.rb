Rails.application.routes.draw do
  # get 'assignments/index'
  # get 'assignments/show'
  # get 'assignments/new'
  # get 'assignments/create'
  # get 'assignments/edit'
  # get 'assignments/update'
  # get 'assignments/destroy'
  # get 'tasks/', to: 'tasks#index'
  # get 'tasks/:id', to: 'tasks#show'
  # get 'tasks/new'
  # get 'tasks/create'
  # get 'tasks/edit'
  # get 'tasks/update'
  # get 'tasks/destroy'
  resources :tasks
  resources :assignments
  devise_for :users
  root to: 'pages#home'
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end
