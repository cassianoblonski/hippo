Rails.application.routes.draw do
  root 'projects#index'

  devise_for :people
  devise_scope :person do
    get 'login', to: 'devise/sessions#new'
  end

  resources :projects do
    resources :histories do
        post 'next_status'
      resources :tasks do
        post 'toggle'
      end
    end
  end
  resources :people, only: :show
end
