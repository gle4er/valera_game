Rails.application.routes.draw do
  devise_for :users
  resource :valeras
  root 'static_pages#home'
end
