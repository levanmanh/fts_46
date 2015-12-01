Rails.application.routes.draw do
  root "application#home"
  devise_for :users
  resources :users do
    resources :questions
  end
end
