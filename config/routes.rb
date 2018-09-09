Rails.application.routes.draw do
  devise_for :users
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html

  devise_scope :social_account do
  	get 'sign_out', to: "sessions#destroy"
  end

  # get '/' => 'users#top'
  root to: 'users#top'
  delete '/blogs/:id' => 'blogs#destroy', as: 'destroy_blog'

  resources :users, only: [:show, :index, :edit, :update]
  resources :blogs, only: [:new, :create, :show, :edit, :update, :index]
  resources :parties, only: [:new, :create, :show, :index]
  resources :favorites, only: [:index, :destroy]

  # resource :sessions, only: [:new, :create, :destroy]
  resources :parties do
    member do
    post "add", to: "favorites#create"
    delete "/add", to: "favorites#destroy"
    end
  end

end
