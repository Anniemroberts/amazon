Rails.application.routes.draw do
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html

  root 'welcome#index'
  get '/about' => 'welcome#about'
  get '/contact_us' => 'welcome#contact_us'
  post '/contact_submit' => 'welcome#contact_submit'

  resources :products, shallow: true do
    # post :search #this will not work: questions/question_id/search
    # post :search, on: :member #questions/:id/search
    # post :search, on: :collection #this is not good for this case either.


    # this creates a set of `answers` routes nested within the `questions`
    # routes. This will make all the `answers` routes prefixed with
    # `/questions/:question_id`
    resources :reviews, only: [:create, :destroy]
  end
    resources :users, only: [:new, :create]
    resources :sessions, only: [:new, :create] do
      delete :destroy, on: :collection
    end
  # get '/products/new' => 'products#new', as: :new_product
  # post '/products' => 'products#create', as: :products
  # get '/products' => 'products#index'
  # get '/products/:id' => 'products#show', as: :product
  # get '/products/:id/edit' => 'products#edit', as: :edit_product
  # patch '/products/:id' => 'products#update'
  # delete '/products/:id'  => 'products#destroy'
end
