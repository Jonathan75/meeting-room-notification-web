Rails.application.routes.draw do
  mount RailsAdmin::Engine => '/admin', as: 'rails_admin'
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html

  root to: 'rooms#index'
  get 'rooms/check', to: 'rooms#check'
  resources :rooms, only: [:index, :show, :edit, :update]
end
