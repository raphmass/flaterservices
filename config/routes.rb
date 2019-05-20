Rails.application.routes.draw do
  get 'assignements/index'
  get 'assignements/show'
  get 'assignements/new'
  get 'assignements/create'
  get 'assignements/edit'
  get 'assignements/update'
  get 'assignements/destroy'
  get 'tasks/index'
  get 'tasks/show'
  get 'tasks/new'
  get 'tasks/create'
  get 'tasks/edit'
  get 'tasks/update'
  get 'tasks/destroy'
  devise_for :users
  root to: 'pages#home'
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end
