Rails.application.routes.draw do
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html

  root to: 'tests#index' 

  devise_for :users, path_names: { sign_in: :login, sign_out: :logout }, controllers: { sessions: "users/sessions" }

  resources :tests, only: :index do
    member do
      post :start
    end
  end

  resources :test_passages, only: %i[show update] do
    member do
      get :result
      post :gist
    end
  end

  get 'my_badges', to: 'badges#my_badges'

  resources :feedbacks, only: %i[new create]
  
  namespace :admin do
    resources :tests do
      patch :update_inline, on: :member
      resources :questions, shallow: true do
        resources :answers, shallow: true
      end
    end
    resources :gists, only: :index
    resources :badges
  end
end
