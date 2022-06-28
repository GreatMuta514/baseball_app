Rails.application.routes.draw do
  resources :users
  get 'static_pages/top'
  root 'static_pages#top'
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
end
