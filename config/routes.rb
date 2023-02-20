# frozen_string_literal: true

Rails.application.routes.draw do
  resources :cars, only: %i[index show]
  scope '(:locale)', locale: /#{I18n.available_locales.join("|")}/ do
    devise_for :users
    root 'homes#index'
    resources :helps, only: %i[index]
    resources :homes, only: %i[index]
    resources :searches, only: %i[index new create]
  end
end
