# frozen_string_literal: true

Rails.application.routes.draw do
  devise_for :users, controllers: { omniauth_callbacks: 'users/omniauth_callbacks' }
  root 'home#index'
  resources :cars, only: %i[index show new create]
  resources :help, only: %i[index]
  resources :home, only: %i[index]
  resources :searches, only: %i[index new create]
end
