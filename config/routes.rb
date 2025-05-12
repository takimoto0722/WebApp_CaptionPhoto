Rails.application.routes.draw do
  devise_for :users
  root 'home#index'
  resources :archives, only: %i[new create show]

  authenticate :user, ->(u) { u.admin? } do
    namespace :admin do
      resources :articles
    end
  end

  # 記事一覧画面および記事詳細画面
  resources :articles, only: %i[index show]
end