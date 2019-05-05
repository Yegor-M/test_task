# frozen_string_literal: true

Rails.application.routes.draw do
  root 'pages#index'
  resources :employees
  resources :departments
end
