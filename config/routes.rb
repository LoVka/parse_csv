Rails.application.routes.draw do
  root to: "uploads#index"

  resources :skus, only: :index
  resources :suppliers, only: :index
  resources :uploads, only: :index
  match 'uploads/import' => 'uploads#import', via: :post
end
