Rails.application.routes.draw do
  devise_for :users
  resource :valera do
    resource :item
    resource :event
  end
  resolve("Item") { [:item] }
  resolve("Valera") { [:valera] }
  root 'static_pages#home'
end