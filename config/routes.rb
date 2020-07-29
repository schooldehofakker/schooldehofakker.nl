Rails.application.routes.draw do
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
  root 'index#index'

  get 'kracht-van-de-hofakker', to: 'kracht#index'
  get 'leraren', to: 'leraren#index'
  resources 'nieuws'
  post '/nieuws/new', to: 'nieuws#create'
  get 'vacatures', to: 'vacatures#index'

  match '/404', to: 'errors#not_found', via: :all
  match '/422', to: 'errors#unacceptable', via: :all
  match '/500', to: 'errors#internal_server_error', via: :all
end
