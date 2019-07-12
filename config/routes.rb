Rails.application.routes.draw do
  root 'projects#index'

  devise_for :people
  devise_scope :person do
    get 'login', to: 'devise/sessions#new'
  end

  resources :projects do
    resources :histories
  end
  resources :tasks
  resources :people, only: :show
end
