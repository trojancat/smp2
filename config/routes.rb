Rails.application.routes.draw do

  devise_for :users

  resources :projects do
    get 'my', on: :collection

    resources :tasks
    resources :meetings
  end

  get 'my_tasks', to: 'tasks#my'
  get 'my_meetings', to: 'meetings#my'

  root 'projects#index'
end
