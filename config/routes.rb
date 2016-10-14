Rails.application.routes.draw do

  root 'home#index'

  resources :customers
  resources :components
  resources :comp_arrays

  resources :charts, only: [] do
    collection do
      get 'comp_arrays'
    end
  end
end
