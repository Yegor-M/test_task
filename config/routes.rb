Rails.application.routes.draw do
  root 'pages#index'
  resources :employees
  resources :departments
end
