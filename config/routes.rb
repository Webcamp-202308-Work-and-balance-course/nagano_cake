Rails.application.routes.draw do
  #resources :admin
  resources :public
  get "/admin" => "admin/homes#top"
  get "/public" => "public/homes#top"
  get "/customers/mypage" => "public/customers#show"
  get "/custormers/information/edit" => "public/customers#edit"
  patch '/customers/information', to: 'public/customers#update', as: 'update_customers_information'
  get "/customers/confirm" => "public/customers#confirm"
  patch "/customers/withdraw" => "public/customers#withdraw", as: 'customers_withdraw'

  

  
  # 管理者用
  devise_for :admin, skip: [:registrations, :passwords], controllers: {
    sessions: "admin/sessions"
  }
  
  # 顧客用
  devise_for :customers, skip: [:passwords], controllers: {
    registrations: "public/registrations",
    sessions: 'public/sessions'
  }
  
  # 管理者側のルーティング設定
  namespace :admin do
    resources :items
    resources :customers, only: [:index, :show, :edit, :update]
  end 
  
    # 会員側のルーティング設定
  scope module: :public do
    resources :items, only: [:index, :show]
  end
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
  

end
