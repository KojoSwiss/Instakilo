Rails.application.routes.draw do
  devise_for :users
  root to: 'pages#home'
  resources :pics do
    member do
      put 'like', to:'pic#upvote'
    end
  end
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
end
