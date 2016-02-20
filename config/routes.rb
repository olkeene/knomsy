Rails.application.routes.draw do
  devise_for :users, controllers: {
    registrations:      'user/registrations', 
    sessions:           'user/sessions', 
    passwords:          'user/passwords', 
    confirmations:      'user/confirmations',
    omniauth_callbacks: 'user/omniauth_callbacks'
  }
  
  scope module: :user do
    resource  :dashboard, only:   [:show]
    resources :profiles,  only:   [:show, :update]
  end
  
  scope module: :company do
    resources :companies, only: [] do
      resources :questions, only: [] do
        collection do
          get :next
        end
        
        resources :answers, only: :create
      end
    end
  end
  
  resources :companies, except: [:edit, :destroy]
  
  resource :data, only: [] do
    get :roles
    get :skills
    get :services
    get :categories
    get :countries
  end
  
  root to: 'home#index'
end
