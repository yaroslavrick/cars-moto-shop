# frozen_string_literal: true

Rails.application.routes.draw do
  devise_for :users
  get 'login/index'
  scope '(:locale)', locale: /#{I18n.available_locales.join("|")}/ do
    root 'home#index'
    resources :cars, only: %i[index show]
    resources :help, only: %i[index]
    resources :home, only: %i[index]
    resources :search, only: %i[index]
  end
end
