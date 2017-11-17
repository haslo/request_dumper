Rails.application.routes.draw do

  resource :dump_request, only: :create
  resources :reqeusts, only: [:index, :show]

end
