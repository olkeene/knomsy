Rails.application.routes.draw do
  namespace :user do
  get 'companies/new'
  end

  devise_for :users, controllers: {registrations: 'user/registrations', sessions: 'user/sessions', passwords: 'user/passwords', confirmations: 'user/confirmations'}
  
  scope module: :user do
    resource  :profile,   only:   [:show, :update]
    resources :companies, except: [:edit, :destroy]
  end
  
  root to: 'home#index'
end
