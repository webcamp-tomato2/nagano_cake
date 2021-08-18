Rails.application.routes.draw do
  get root to: 'homes#top'
  get 'homes/about' => 'homes#about'
  fasf
 devise_for :customers, controllers: {
      sessions:      'customers/sessions',
      passwords:     'customers/passwords',
      registrations: 'customers/registrations'
  }
  devise_for :admins, controllers: {
    sessions:      'admins/sessions',
    passwords:     'admins/passwords',
    registrations: 'admins/registrations'
  }
  
  namespace :public do
    resources :items, only: [:index, :show] do
      resources :orders, only: [:show, :create]
      post 'orders/comfirm' => 'orders#comfirm'
    end

    resources :customers, only: [:show, :edit, :update] do
      put "/users/:id/hide" => "users#hide", as: 'users_hide'
      resources :shippings
    end

    resources :cart_items, only: [:index, :create, :destroy]
    resources :oder_items, only: [:index, :show]
    end
    

  namespace :admin do

    resources :items
    resources :customers, only: [:index, :show]
    resources :genres, only: [:index, :create, :edit, :update]
    resources :oder_items, only: [:index, :show]
  end

end