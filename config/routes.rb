Rails.application.routes.draw do
  devise_for :users, controllers: {registrations: 'user/registrations', sessions: 'user/sessions', passwords: 'user/passwords', confirmations: 'user/confirmations'}
  
  scope module: :user do
    resource :profile, only: [:show, :update]
  end
  
  root to: 'home#index'
end
