# frozen_string_literal: true

Rails.application.routes.draw do
  get 'home/index'
  scope '(:locale)', locale: /#{I18n.available_locales.join("|")}/ do
    resources :cars
    root 'home#index'
    # Define your application routes per the DSL in https://guides.rubyonrails.org/routing.html

    # Defines the root path route ("/")
    # root "articles#index"
  end
end
