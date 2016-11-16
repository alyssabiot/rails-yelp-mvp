Rails.application.routes.draw do
  namespace :admin do
    resources :restaurants do
      resources :reviews
    end
  end
  resources :restaurants, only: [ :index, :show, :new, :create ] do
    resources :reviews, only: [ :new, :create ]
  end
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end
