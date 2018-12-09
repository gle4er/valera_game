Rails.application.routes.draw do
  devise_for :users
  resources :valeras
  root 'static_pages#home'
end
