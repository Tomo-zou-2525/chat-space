Rails.application.routes.draw do
  devise_for :users #自動生成
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html

  root "groups#index" 
  resources :users, only: [:edit, :update] 
  resources :groups, only: [:new, :create, :edit, :update, :index] do
    resources :messages, only: [:index]
  end
end
