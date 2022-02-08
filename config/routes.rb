Rails.application.routes.draw do

  devise_for :users
  root 'category#index'

  resources :categories do
    resources :tasks
  end
 
end
