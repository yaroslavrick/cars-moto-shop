# frozen_string_literal: true

Rails.application.routes.draw do
  devise_for :users
  get 'login/index'
  scope '(:locale)', locale: /#{I18n.available_locales.join("|")}/ do
    root 'homes#index'
    resources :cars, only: %i[index show]
    resources :helps, only: %i[index]
    resources :homes, only: %i[index]
    resources :searches, only: %i[index new create]
  end
end
