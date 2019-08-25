Rails.application.routes.draw do


  devise_for :admins, controllers: {
  sessions:      'admins/sessions',
  passwords:     'admins/passwords',
  registrations: 'admins/registrations'
  }

  devise_for :end_users, controllers: {
  sessions:      'end_users/sessions',
  passwords:     'end_users/passwords',
  registrations: 'end_users/registrations'
  }

  root 'tops#top'
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
  resources :end_users, only: [:leave,:edit,:update,:show] do
    get 'orders/finish' => 'orders#finish'
    get 'orders/confirm' => 'orders#confirm'
    resources :orders, only: [:create,:index,:show]
    post 'carts/:id' => 'carts#add', as: 'cart_add'
    resources :carts, only: [:destroy,:index]
  end
  # artist,labelでも拡張可能？
  get 'sell_cds/genreidsearch/:genre_id' => 'sell_cds#genreidsearch', as: 'sell_cds_genreidserch'
  resources :sell_cds, only: [:search,:show] do
    resource :favorites, only: [:create,:destroy,:show]
  end



  namespace :admins do
    get 'sell_cds/artist_new' => 'sell_cds#artist_new'
    get 'sell_cds/genre_new' => 'sell_cds#genre_new'
    get 'sell_cds/label_new' => 'sell_cds#label_new'
    get 'sell_cds/main_new' => 'sell_cds#main_new'
    post 'sell_cds/artist_create' => 'sell_cds#artist_create'
    post 'sell_cds/genre_create' => 'sell_cds#genre_create'
    post 'sell_cds/label_create' => 'sell_cds#label_create'
    post 'sell_cds/main_create' => 'sell_cds#main_create'
    put 'sell_cds/artist_update' => 'sell_cds#artist_update'
    put 'sell_cds/genre_update' => 'sell_cds#genre_update'
    put 'sell_cds/label_update' => 'sell_cds#label_update'
    put 'sell_cds/main_update' => 'sell_cds#main_update'
    resources :sell_cds, only: [:index,:edit,:destroy,:show]
    get 'top' => 'top#top'
    resources :orders, only: [:index]
    resources :end_users, only: [:index,:edit,:destroy,:show,:update] do
      resources :orders, only: [:show,:update]
    end
  end


end
