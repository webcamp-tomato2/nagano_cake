Rails.application.routes.draw do

  get 'search/search'
  get root to: 'homes#top'
  get 'homes/about' => 'homes#about'

  devise_for :customers,path:"", controllers: {
      sessions:      'customers/sessions',
      passwords:     'customers/passwords',
      registrations: 'customers/registrations'
  }
  devise_for :admins, controllers: {
    sessions:      'admins/sessions'
  }



  scope module: :public do
    resource :customers, only: [:show, :edit, :update]
    get '/customers/unsubscribe' => 'customers#unsubscribe', as: 'customers_unsubscribe'
    patch '/customers/withdraw' => 'customers#withdraw', as: 'customers_withdraw'

    resources :items, only: [:index, :show]
    get 'orders/confirm' => 'orders#confirm'
    get 'orders/thanx' => 'orders#thanx'
    resources :orders, only: [:new, :index, :show, :create]


    resources :addresses, except: [:new, :show]

    delete '/cart_items/destroy_all' => 'cart_items#all_destroy'
    resources :cart_items, only: [:index, :update, :create, :destroy]


  end


  namespace :admin do
    resources :items, except: [:destroy]
    resources :customers, only: [:index, :show, :edit, :update]
    resources :genres, only: [:index, :create, :edit, :destroy, :update]
    get 'orders/:customer_id/cus_index' => 'orders#cus_index'
    resources :orders, only: [:index, :show, :update]
    resources :order_details, only: [:update]
  end

end