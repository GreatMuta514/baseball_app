Rails.application.routes.draw do
  # 問い合わせ機能
  resources :contacts, only: %i[new create]
  get 'contacts/done', to: 'contacts#done'

  # 管理者機能
  namespace :admin do
    resources :users, except: %i[new create]
  end

  # 予想機能
  resources :pro_games, only: [:create] do
    resources :pro_game_predicts, only: %i[new create]
    resources :pro_game_predict_comments, only: %i[create destroy]
  end

  # 予想閲覧機能
  resources :game_predicts, only: [:show]
  get 'game_predicts/confirmation' => 'game_predicts#confirmation'
  get 'game_predicts/results' => 'game_predicts#results'

  # actioncable
  mount ActionCable.server => '/cable'
  # メール関係
  mount LetterOpenerWeb::Engine, at: '/letter_opener' if Rails.env.development?
  resources :password_resets, only: %i[new create edit update]

  # チャットルーム
  resources :chatrooms, only: :show do
    resources :chats, only: %i[index create destroy]
  end

  # ログイン
  get 'login' => 'user_sessions#new', :as => :login
  post 'login' => 'user_sessions#create'
  post 'logout' => 'user_sessions#destroy', :as => :logout
  # ゲストログイン機能
  post 'guest_login', to: 'user_sessions#guest_login'

  # ユーザー
  resources :users, except: [:index]

  # 利用規約・プライバシーポリシーなど
  get 'static_pages/terms_of_service' => 'static_pages#terms_of_service'
  get 'static_pages/privacy_policy' => 'static_pages#privacy_policy'

  # トップ
  get 'static_pages/top'
  root 'static_pages#top'
end
