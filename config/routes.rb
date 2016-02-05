Rails.application.routes.draw do
  devise_for :users, controllers: {registrations: 'user/registrations', sessions: 'user/sessions', passwords: 'user/passwords', confirmations: 'user/confirmations'}
  
  scope module: :user do
    resource  :dashboard, only:   [:show]
    resources :profiles,  only:   [:show, :update]
    resources :companies, except: [:edit, :destroy]
  end
  
  resource :data, only: [] do
    get :roles
    get :skills
    get :services
  end
  
  root to: 'home#index'
end
