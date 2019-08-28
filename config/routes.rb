Rails.application.routes.draw do

get 'end_users/leave' => 'end_users#leave', as: 'end_user_leave'
get 'sell_cds/search' => 'sell_cds#search', as: 'sell_cds_search'

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
 resources :end_users, only: [:edit,:update,:show] do
   get 'orders/:id/finish',  to: 'orders#finish', as: 'finish'
   get 'orders/confirm' => 'orders#confirm', as: 'confirm'
   post 'carts/:id' => 'carts#add', as: 'cart_add'
   resources :orders, only: [:create,:index,:show]
   resources :carts, only: [:destroy,:index]
   resources :delivery_addresses, only: [:create,:update,:destroy]
 end
 # artist,labelでも拡張可能？
 get 'sell_cds/genreidsearch/:genre_id' => 'sell_cds#genreidsearch', as: 'sell_cds_genreidsearch'
 resources :sell_cds, only: [:search,:show] do
   resource :favorites, only: [:create,:destroy,:show]
 end


 namespace :admins do
   get 'sell_cds/genre_new' => 'sell_cds#genre_new'
   get 'sell_cds/artist_new' => 'sell_cds#artist_new'
   get 'sell_cds/label_new' => 'sell_cds#label_new'
   get 'sell_cds/main_new' => 'sell_cds#main_new'
   get 'sell_cds/genre_index' => 'sell_cds#genre_index'
   get 'sell_cds/artist_index' => 'sell_cds#artist_index'
   get 'sell_cds/label_index' => 'sell_cds#label_index'
   get 'sell_cds/genre_edit/:id' => 'sell_cds#genre_edit',as:'sell_cds_genre_edit'
   get 'sell_cds/artist_edit/:id' => 'sell_cds#artist_edit',as:'sell_cds_artist_edit'
   get 'sell_cds/label_edit/:id' => 'sell_cds#label_edit',as:'sell_cds_label_edit'
   get 'sell_cds/genre_show/:id' => 'sell_cds#genre_show',as: 'sell_cds_genre_show'
   get 'sell_cds/artist_show/:id' => 'sell_cds#artist_show',as: 'sell_cds_artist_show'
   get 'sell_cds/label_show/:id' => 'sell_cds#label_show',as: 'sell_cds_label_show'
   delete 'sell_cds/genre/:id' => 'sell_cds#genre_destroy' ,as: 'sell_cds_genre_destroy'
   delete 'sell_cds/artist/:id' => 'sell_cds#artist_destroy',as: 'sell_cds_artist_destroy'
   delete 'sell_cds/label/:id' => 'sell_cds#label_destroy',as: 'dell_cds_label_destroy'
   post 'sell_cds/artist_create' => 'sell_cds#artist_create'
   post 'sell_cds/genre_create' => 'sell_cds#genre_create'
   post 'sell_cds/label_create' => 'sell_cds#label_create'
   post 'sell_cds/main_create' => 'sell_cds#main_create'
   patch 'sell_cds/:id/genre_update' => 'sell_cds#genre_update',as: 'sell_cds_genre_update'
   patch 'sell_cds/:id/artist_update' => 'sell_cds#artist_update',as: 'sell_cds_artist_update'
   patch 'sell_cds/:id/label_update' => 'sell_cds#label_update',as: 'sell_cds_label_update'
   patch 'sell_cds/:id/main_update' => 'sell_cds#main_update',as: 'sell_cds_main_update'
   get 'sell_cds/:id/main_edit' => 'sell_cds#main_edit',as: 'sell_cds_main_edit'
   resources :orders, only: [:index]
   get 'top' => 'top#top'
   resources :sell_cds, only: [:index,:destroy,:show]
   resources :end_users, only: [:index,:edit,:destroy,:show,:update] do
     resources :orders, only: [:show,:update]
   end
 end
end
