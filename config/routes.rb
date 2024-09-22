Rails.application.routes.draw do
  root 'public#index' # will render when http://localhost:3000/ is browsed

  get 'show/:permalink', to: 'public#show'

  get 'demo/index'
  get 'demo/hello'
  get 'demo/other_hello'
  get 'demo/welldev'
  get 'demo/escape_output'

  get 'admin', to: 'access#menu'
  get 'access/menu'
  get 'access/login'
  post 'access/attempt_login'
  get 'access/logout'

  get 'sections/index'
  get 'sections/show'
  get 'sections/new'
  get 'sections/edit'
  get 'sections/delete'
  get 'pages/index'
  get 'pages/show'
  get 'pages/new'
  get 'pages/edit'
  get 'pages/delete'
  # get 'subjects/index'
  # get 'subjects/show'
  # get 'subjects/new'
  # get 'subjects/edit'
  # get 'subjects/delete'

  resources :subjects do
    member do
      get :delete
    end
  end

  resources :pages do
    member do
      get :delete
    end
  end

  resources :sections do
    member do
      get :delete
    end
  end

  resources :admin_users, except: [:show] do
    member do
      get :delete
    end
  end

  # Modify Routes to Include Locale Scope
  Rails.application.routes.draw do
    get 'pubilc/index'
    get 'pubilc/show'
    get 'admin_users/index'
    get 'admin_users/new'
    get 'admin_users/edit'
    get 'admin_users/delete'
    get 'access/menu'
    get 'access/login'
    scope '(:locale)', locale: /en|es|bn/ do
      # Your routes here
      resources :subjects
      resources :pages
      resources :sections
    end
  end

  # default route (may go away in future versions)
  # get ':controller(/:action(/:id))'
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
end
