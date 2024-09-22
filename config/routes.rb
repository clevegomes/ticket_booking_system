Rails.application.routes.draw do
  devise_for :users
  # Define your application routes per the DSL in https://guides.rubyonrails.org/routing.html

  # Defines the root path route ("/")
  # root "articles#index"
  resources :events do
    resources :ticket_bookings, only: [:new, :create]
  end

  get 'my_events', to: 'events#my_events'
  get 'my_bookings', to: 'events#my_ticket_bookings'

  root to: 'events#index'
end
