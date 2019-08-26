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

  delete 'end_users/:id', to: 'end_users#leave',as: 'end_user_leave'
  get 'search', to: 'end_users#leave',as: 'end_user_leave'

  root 'tops#top'
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
  resources :sell_cds, only: [:search,:show]
  resources :end_users, only: [:edit,:update,:show] do
    get 'orders/:id/finish',  to: 'orders#finish', as: 'finish'
    get 'orders/confirm',  to: 'orders#confirm', as: 'confirm'
    resources :orders, only: [:create,:index,:show]
    post 'carts/:id' => 'carts#add', as: 'cart_add'
    resources :carts, only: [:destroy,:index]
    resources :delivery_addresses, only: [:create,:update]
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
    resources :end_users, only: [:index,:edit,:destroy,:show,:update] do
      resources :orders, only: [:show,:update,:index]
    end
  end


end
