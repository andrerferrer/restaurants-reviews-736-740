Rails.application.routes.draw do
  # get 'restaurants/:restaurant_id/reviews', to: 'reviews#index', as: :restaurant_reviews

  resources :restaurants do

    resources :reviews, only: [ :new, :create ]

    member do
      # get 'restaurants/:id/chef', to: 'restaurants#chef', as: :chef_restaurant
      get :chef
    end

    # get 'restaurants/top', to: 'restaurants#top', as: :top_restaurants
    collection do
      get :top
    end

  end

  # member actions - not be nested
  resources :reviews, only: [ :destroy ]

  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
end
