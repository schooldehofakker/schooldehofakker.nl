Rails.application.routes.draw do
  devise_for :users
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
  root 'index#index'

  get 'bedankt', to: 'bedankt#index'
  get 'contact', to: 'contact#index'
  post 'contact', to: 'contact#new'
  get 'kracht-van-de-hofakker', to: 'kracht#index'
  get 'leraren', to: 'leraren#index'
  resources 'nieuws'
  get '/nieuws/:slug', to: 'nieuws#show'
  get 'vacatures', to: 'vacatures#index'
end
