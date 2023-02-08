# frozen_string_literal: true

Rails.application.routes.draw do
  scope '(:locale)', locale: /#{I18n.available_locales.join("|")}/ do
    root 'home#index'
    resources :cars, only: %i[index show]
    resources :help, only: %i[index]
    resources :home, only: %i[index]
    resources :search, only: %i[index]
    # get 'help/index'
    # get 'home/index'
    # get 'search/index'
    # Define your application routes per the DSL in https://guides.rubyonrails.org/routing.html

    # Defines the root path route ("/")
    # root "articles#index"
  end
end
