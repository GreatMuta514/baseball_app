Rails.application.routes.draw do
  
  
  resources :pro_games, only: [:create] do
    resources :pro_game_predicts, only: [:new, :create]
  end

  #予想
  get 'game_predicts' => 'game_predicts#index'
  get 'game_predicts/confirmation' => 'game_predicts#confirmation'
  get 'game_predicts/results' => 'game_predicts#results'

  #actioncable
  mount ActionCable.server => '/cable'
  #メール関係
  mount LetterOpenerWeb::Engine, at: "/letter_opener" if Rails.env.development?
  resources :password_resets, only: [:new, :create, :edit, :update]

  #チャットルーム
  resources :chatrooms, only: [:index, :show] do
    resources :chats, only: [:create, :destroy]
  end

  #ログイン
  get 'login' => 'user_sessions#new', :as => :login
  post 'login' => "user_sessions#create"
  post 'logout' => 'user_sessions#destroy', :as => :logout
  
  #ユーザー
  resources :users
  get 'static_pages/top'
  root 'static_pages#top'
end
