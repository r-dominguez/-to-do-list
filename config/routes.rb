Rails.application.routes.draw do
  mount RailsAdmin::Engine => '/admin', as: 'rails_admin'
  devise_for :users
  root to: 'tasks#index'
  resources :tasks

  get 'up' => 'rails/health#show', as: :rails_health_check
end
