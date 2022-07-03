Rails.application.routes.draw do
  
  #actioncable
  mount ActionCable.server => '/cable'
  #メール関係
  mount LetterOpenerWeb::Engine, at: "/letter_opener" if Rails.env.development?
  resources :password_resets, only: [:new, :create, :edit, :update]

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
