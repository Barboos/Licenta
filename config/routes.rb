Rails.application.routes.draw do
  get 'users/new'
  get 'static_pages/home'
  get 'static_pages/help'
  get 'sessions/new'
  root 'static_pages#home'
  get     '/signup',    to: 'users#new'
  get     '/predict_price',      to: 'apartaments#predict_price'
  post    '/predict_price',      to: 'apartaments#run_predict_price'
  get     '/show_predicted_apartament', to: 'apartaments#show_apartament'
  get     '/about',     to: 'static_pages#about'
  get     '/help',     to: 'static_pages#help'
  get     '/contact',   to: 'static_pages#contact'
  get     '/login',     to: 'sessions#new'
  post    '/login',     to: 'sessions#create'
  delete  '/logout',    to: 'sessions#destroy'
  resources :users do 
    resources :apartaments, only: [:create, :new, :index]
  end

  resources :apartaments, only: [:show]
 
end
