Rails.application.routes.draw do
  resources :employees do
    collection { post :import }
  end
end