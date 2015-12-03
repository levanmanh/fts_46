Rails.application.routes.draw do
  root "application#home"
  devise_for :users
  resources :users do
    resources :questions
  end
  namespace :admin do
    root "questions#index"
    resources :questions
  end
  resources :exams, only: [:create, :index]
end
