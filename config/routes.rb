Rails.application.routes.draw do
  devise_for :users #自動生成
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html

  root to: "messages#index" #messageコントローラーのindexアクションに飛ぶ
  resources :users, only: [:edit, :update] #usersコントローラのedit,updateアクションへのルートを通す
end
