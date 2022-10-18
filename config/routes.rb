Rails.application.routes.draw do
  root 'users#new'
  resources :sessions
  resources :favorites
  resources :users do
    collection do
      post :confirm
    end
  end  
  resources :blogs do
    collection do
      post :confirm
    end
  end  
end