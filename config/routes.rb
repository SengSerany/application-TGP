Rails.application.routes.draw do
  get 'comments/index'
  get 'comments/show'
  get 'comments/new'
  get 'comments/create'
  get 'comments/edit'
  get 'comments/update'
  get 'comments/destroy'
	get '/', to: 'gossips#index'
  resources :sessions, only: [:new, :create, :destroy]
  resources :cities
  resources :users
  resources :gossips

    resources :gossips do
    resources :comments
  end

  resources :comments do
    resources :comments
  end
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end
