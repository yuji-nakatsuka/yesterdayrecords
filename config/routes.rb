Rails.application.routes.draw do

  get 'end_users/end_user_id/orders/:id/finish',  to: 'orders#finish', as: 'finish'

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
    resources :orders, only: [:confirm,:create,:finish,:index,:show]
    resources :carts, only: [:destroy,:index]
    post 'carts/:id' => 'carts#add' ,as: 'cart_add'

  end

  resources :sell_cds, only: [:searrch,:show]



  namespace :admins do
    resources :sell_cds, only: [:index,:edit,:destroy,:new,:show,:update,:create]
    get 'top' => 'top#top'
    resources :end_users, only: [:index,:edit,:destroy,:show,:update] do
      resources :orders, only: [:show,:update]
    end
  end


end
