Rails.application.routes.draw do
  devise_for :users
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
  root 'index#index'

  get 'bedankt', to: 'bedankt#index'
  get 'contact', to: 'contact#index'
  post 'contact', to: 'contact#new'
  get 'feed.xml', to: 'feeds#rss', format: 'rss'
  get 'kracht-van-de-hofakker', to: 'kracht#index'
  get 'leraren', to: 'leraren#index'
  resources 'nieuws'
  get '/nieuws/:slug', to: 'nieuws#show'
  get 'vacatures', to: 'vacatures#index'

  get '/sitemap.xml.gz', to: redirect("https://s3-#{Rails.application.credentials.aws[:region]}.amazonaws.com/#{Rails.application.credentials.aws[:bucket]}/sitemap.xml.gz")
end
