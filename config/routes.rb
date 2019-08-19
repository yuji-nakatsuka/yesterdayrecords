Rails.application.routes.draw do
  devise_for :admins, controllers: {
  sessions:      'admins/sessions',
  passwords:     'admins/passwords',
  registrations: 'admins/registrations'
<<<<<<< HEAD
}
=======
  }
>>>>>>> 7e48367bea9975bbc95458759c7b110fd72e8373
  devise_for :end_users, controllers: {
  sessions:      'end_users/sessions',
  passwords:     'end_users/passwords',
  registrations: 'end_users/registrations'
<<<<<<< HEAD
}
=======
  }
>>>>>>> 7e48367bea9975bbc95458759c7b110fd72e8373
  root 'tops#top'
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
  resources :end_users, only: [:leave,:edit,:update] do
    resources :orders, only: [:confirm,:create,:finish,:index,:show]
    resources :carts, only: [:destroy,:index,:add]
  end

  resources :sell_cds, only: [:searrch,:show]



  namespace :admins do
    resources :sell_cds, only: [:index,:edit,:destroy,:new,:show,:update,:create]
<<<<<<< HEAD
    resource :end_users, only: [:index,:edit,:destroy,:show,:update]
=======
    get 'top' => 'top#top'
    resources :end_users, only: [:index,:edit,:destroy,:show,:update] do
>>>>>>> 7e48367bea9975bbc95458759c7b110fd72e8373
      resources :orders, only: [:show,:update]
  end
end
