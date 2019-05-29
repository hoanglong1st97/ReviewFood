Rails.application.routes.draw do
  devise_for :users
  resources :foods do
    resources :reviews
  end
  root 'foods#index'
end
