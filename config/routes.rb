Rails.application.routes.draw do
  resources :mailing_lists

  resources :challenge_statements do
    resources :submissions
  end

  resources :challenge_statements do
    post 'join', on: :member
  end
  #static-pages
  get 'static_pages/home'
  get 'static_pages/faq'
  get 'static_pages/rules'

  #contact-us
  get 'contact-us', to: 'messages#new', as: 'new_message'
  post 'contact-us', to: 'messages#create', as: 'create_message'

  #users
  devise_for :users, controllers: { sessions: 'users/sessions' }
  get '/user' => "challenge_statements#index", :as => :user_root

  #get 'users/:id/uploads' => 'users#uploads', :as => :user_uploads

  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
  root to: "static_pages#home"
end
