Rails.application.routes.draw do
  devise_for :users
  resources :users do
    resources :valeras
  end
  root 'static_pages#home'
end
