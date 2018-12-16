Rails.application.routes.draw do
  devise_for :users
  resource :valeras
  resolve("Valera") { [:valeras] }
  root 'static_pages#home'
end
