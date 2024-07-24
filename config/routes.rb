Rails.application.routes.draw do

  # get 'subjects/index'
  # get 'subjects/show'
  # get 'subjects/new'
  # get 'subjects/edit'
  # get 'subjects/delete'

  root 'demo#index' # will render when http://localhost:3000/ is browsed
  get 'demo/index'
  get 'demo/hello'
  get 'demo/other_hello'
  get 'demo/welldev'

  resources :subjects do
    member do
      get :delete
    end
  end
  # default route (may go away in future versions)
  # get ':controller(/:action(/:id))'
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
end
