Rails.application.routes.draw do
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
  resources :bookers, :bookings, :listers, :listings

  get '/', to: 'application#welcome', as: 'welcome'
  get '/bookers/:id/book', to: 'bookers#new_booker_listing', as: 'new_booker_booking'
end
