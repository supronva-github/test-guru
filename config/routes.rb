Rails.application.routes.draw do
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html

  root to: 'tests#index'

  get :singup, to: 'users#new'

  get :login, to: 'sessions#new'

  get :logout, to: 'sessions#destroy'

  resources :users, only: :create

  resources :sessions, only: :create

  resources :tests, only: %i[index show] do
    resources :questions, shallow: true do
      resources :answers, shallow: true
    end
    member do
      post :start
    end
  end

  resources :test_passages, only: %i[show update] do
    member do
      get :result
    end
  end
end
