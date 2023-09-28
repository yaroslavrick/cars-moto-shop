# frozen_string_literal: true

Rails.application.routes.draw do
  scope '(:locale)', locale: /#{I18n.available_locales.join("|")}/ do
    devise_for :users
    root 'home#index'
    resources :cars, only: %i[index show new create]
    resources :help, only: %i[index]
    resources :home, only: %i[index]
    resources :searches, only: %i[index new create]
  end
end
