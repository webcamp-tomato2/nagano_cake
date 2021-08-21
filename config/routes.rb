Rails.application.routes.draw do

  get root to: 'homes#top'
  get 'homes/about' => 'homes#about'

  devise_for :customers, controllers: {
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

    resources :orders, only: [:new, :index, :show, :create]
    post 'orders/comfirm' => 'orders#comfirm'
    get 'orders/thanx' => 'orders#thanx'

    resources :addresses, except: [:new, :show]

    resources :cart_items, only: [:index, :update, :create, :destroy]
    delete '/cart_items/destroy_all' => 'cart_items#destroy_all'

  end


  namespace :admin do
    resources :items, except: [:destroy]
    resources :customers, only: [:index, :show, :edit, :update]
    resources :genres, only: [:index, :create, :edit, :destroy, :update]
    resources :orders, only: [:index, :show, :update]
    resources :order_items, only: [:update]
  end

end