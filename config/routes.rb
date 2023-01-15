Rails.application.routes.draw do
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html

  root to: 'tests#index' 

  devise_for :users, path_names: { sign_in: :login, sign_out: :logout }, controller: { registrations: "users/registrations" }
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
