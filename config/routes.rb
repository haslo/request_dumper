Rails.application.routes.draw do

  resource :dump_request, only: :create
  resources :requests, only: :index

end
