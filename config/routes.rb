Rails.application.routes.draw do
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html

  root 'operations#index'

  resources :operations, only: [:index] do
    match 'import', to: 'operations#import', via: [:get, :post], on: :collection
    match 'export', to: 'operations#export', via: [:get, :post], on: :collection
  end
end
