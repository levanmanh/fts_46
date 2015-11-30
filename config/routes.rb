Rails.application.routes.draw do
  root "application#home"
  devise_for :users
end
