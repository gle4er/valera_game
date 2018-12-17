Rails.application.routes.draw do
  devise_for :users
  resource :valeras do
    resource :items
  end
  resolve("Valera") { [:valeras] }
  resolve("Item") { [:items] }
  root 'static_pages#home'
end
