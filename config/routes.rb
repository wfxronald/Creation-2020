Rails.application.routes.draw do
  get 'static_pages/home'
  get 'static_pages/faq'
  devise_for :users
  resources :uploads
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
  root to: "static_pages#home"
end
