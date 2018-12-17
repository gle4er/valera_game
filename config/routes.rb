Rails.application.routes.draw do
  devise_for :users
  resource :valeras do
    resources :items
  end
  resolve("Valera") { [:valeras] }
  root 'static_pages#home'
end
