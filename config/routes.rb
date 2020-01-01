Rails.application.routes.draw do
  resources :challenge_statements do
    resources :submissions
  end
  get 'static_pages/home'
  get 'static_pages/faq'


  devise_for :users, controllers: { sessions: 'users/sessions' }

  #get 'users/:id/uploads' => 'users#uploads', :as => :user_uploads

  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
  root to: "static_pages#home"
end
