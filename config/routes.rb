Rails.application.routes.draw do
  root 'users#new'
  resources :contacts
  mount LetterOpenerWeb::Engine, at: "/inbox" 
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