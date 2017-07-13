Rails.application.routes.draw do
  get 'macbeth/index'
  resources :xml_parses
  root 'macbeth#index'

  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end
