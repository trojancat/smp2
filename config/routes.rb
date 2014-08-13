Rails.application.routes.draw do

  devise_for :users

  resources :projects do
    get 'my', on: :collection
    resources :tasks, :meetings
  end

  get 'my_tasks', to: 'tasks#my'

  root 'projects#index'
end
