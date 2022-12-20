Rails.application.routes.draw do

  namespace :public do
    resources :pictures, only: [:new, :create, :index, :show, :edit, :destroy, :update] do
      resource :likes, only: [:create, :destroy]
      resources :picture_comments, only: [:create, :destroy]
    end
    resources :users, only: [:show, :edit, :update] do
      resource :relationships, only: [:create, :destroy]
      get 'following_user' => 'relationships#following_user', as: 'following_user'
      get 'followed_user' => 'relationships#followed_user', as: 'followed_user'
    end
  end
  get 'homes/top'
  devise_for :admin, skip: [:registrations, :passwords] ,controllers: {
    sessions: "admin/sessions"
  }

  devise_for :users,skip: [:passwords], controllers: {
    registrations: "public/registrations",
    sessions: 'public/sessions'
  }

  namespace :admin do
    root to: "homes#top"
  end

  scope module: :public do
    root to: "homes#top"
  end
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
end
