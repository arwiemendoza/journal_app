Rails.application.routes.draw do

  root 'category#index'

  resources :categories do
    resources :tasks
  end
 
end
