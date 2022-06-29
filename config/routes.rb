Rails.application.routes.draw do
  
  resources :chatrooms, only: [:index, :show] do
    resources :chats, only: [:create, :destroy]
  end
  get 'login' => 'user_sessions#new', :as => :login
  post 'login' => "user_sessions#create"
  post 'logout' => 'user_sessions#destroy', :as => :logout
  
  resources :users
  get 'static_pages/top'
  root 'static_pages#top'
end
