Rails.application.routes.draw do

  resources :users, except: :index
  resources :listings, only: [:index, :new, :create, :update, :show, :destroy]
  resources :bookings, only: [:index, :create, :update, :show, :destroy]

  get '/', to: 'application#welcome', as: 'welcome'
  get '/login', to: 'sessions#new', as: 'new_session'
  post '/login', to: 'sessions#create'
  delete '/logout', to: 'sessions#destroy', as: 'logout'

  get '/users/:id/new_listing', to: "listings#new", as: "create_listing"
  get '/users/:id/edit_listing', to: "listings#edit", as: "edit_listing"

  get '/users/:start_date/new_booking', to: "bookings#new", as: "create_booking"
  get '/users/:id/edit_booking', to: "bookings#edit", as: "edit_booking"

end
