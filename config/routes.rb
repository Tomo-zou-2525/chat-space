Rails.application.routes.draw do
  devise_for :users #自動生成
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html

  root "groups#index" 
  resources :users, only: [:index, :edit, :update] 
  resources :groups, only: [:new, :create, :edit, :update, :index] do
    resources :messages, only: [:index, :create]

    namespace :api do
      resources :messages, only: :index, defaults: { format: 'json' }
    end
  end #defaultsオプションを利用して、このルーティングが来たらjson形式でレスポンスするよう指定しています。
end