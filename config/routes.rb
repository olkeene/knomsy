Rails.application.routes.draw do
  get 'registrations/create'

  devise_for :users, controllers: {registrations: 'registrations', sessions: 'sessions', passwords: 'passwords', confirmations: 'confirmations'}
  
  root to: 'home#index'
end
