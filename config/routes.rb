Rails.application.routes.draw do



   #顧客用
  devise_for :users, skip: [:passwords], controllers: {
    registrations: "public/registrations",
    sessions: 'public/sessions'
  }

  #管理者用
  devise_for :admin, skip: [:registrations, :passwords], controllers: {
    sessions: "admin/sessions"
  }

  scope module: :public do
    root to: 'homes#top'
    get '/about' => 'homes#about', as: 'about'
    get 'users/my_page' => 'users#show'
    get 'users/information/edit' => 'users#edit'
    patch 'users/information' => 'users#update'
    get 'users/detain' => 'users#detain'
    patch 'users/out' => 'users#out'
    get 'my_posts' => 'posts#my_index'
    #patch 'posts/destroy' => 'posts#destroy'
    get 'posts/:id/detail' => 'posts#detail', as: 'detail_post'
    get 'user/favorites/index' => 'favorites#index'
    #↓コメント一覧を作成したいが、これを入れるとコメントができなくなる
    #get 'post/comments' => 'comments#index'
    resources :posts, only: [:new, :create, :index, :show, :edit, :update, :destroy] do
     resource :favorites, only: [:create, :destroy]
     resources :comments, only: [:create, :destroy]
    end
  end

  namespace :admin do
    get '/' => 'homes#top'
    resources :users, only: [:index, :show, :edit, :update]
    resources :tags, only: [:index, :create, :edit, :update]
    resources :posts, only: [:show, :edit, :update]
  end
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
end
