Rails.application.routes.draw do
  resources :admin
  resources :customers
  get "/admin" => "admin/homes#top"
  get "/public" => "public/homes#top"
  get "/public/mypage" => "public/customers#show"
  
  # 管理者用
  devise_for :admin, skip: [:registrations, :passwords], controllers: {
    sessions: "admin/sessions"
  }
  
  # 顧客用
  devise_for :customers, skip: [:passwords], controllers: {
    registrations: "public/registrations",
    sessions: 'public/sessions'
  }
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
  

end
