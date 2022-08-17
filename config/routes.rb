Rails.application.routes.draw do
  

  #問い合わせ機能
  resources :contacts, only: [:new, :create]
  get 'contacts/done', to: 'contacts#done'

  #管理者機能
  namespace :admin do
    resources :users, except: [:new, :create] 
  end

  #予想機能
  resources :pro_games, only: [:create] do
    resources :pro_game_predicts, only: [:new, :create]
    resources :pro_game_predict_comments, only: [:create, :destroy]
  end

  #予想閲覧機能
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
  #ゲストログイン機能
  post 'guest_login', to: 'user_sessions#guest_login'
  
  #ユーザー
  resources :users, except: [:index] 

  #トップ
  get 'static_pages/top'
  root 'static_pages#top'
end
