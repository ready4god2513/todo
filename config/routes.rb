Rails.application.routes.draw do

  scope constraints: { format: :json } do
    resources :lists
    resources :users, only: [:show, :update, :destroy]
    resources :authentications, only: [:create] do
      delete 'destroy', on: :collection, as: :delete
    end
  end

  root to: "home#index"

end