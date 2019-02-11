Rails.application.routes.draw do

  get '/', to: 'application#welcome', as: 'welcome'

end
