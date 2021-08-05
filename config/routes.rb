# frozen_string_literal: true

Rails.application.routes.draw do
  resources :authors, only: %i[index show]
  resources :books, only: %i[index show]
end
