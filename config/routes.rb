Rails.application.routes.draw do

  resources :bookings
  resources :listings
  resources :users

  get '/', to: 'application#welcome', as: 'welcome'
  get '/login', to: 'sessions#new', as: 'new_session'
  post '/login', to: 'sessions#create'
  delete '/logout', to: 'sessions#destroy', as: 'logout'

  get '/users/:id/new_listing', to: "listings#new", as: "create_listing"
  get '/users/:id/edit_listing', to: "listings#edit", as: "edit_a_listing"

  get '/users/:start_date/new_booking', to: "bookings#new", as: "create_booking"
  get '/users/:start_date/edit_booking', to: "bookings#edit", as: "edit_a_booking"

end
