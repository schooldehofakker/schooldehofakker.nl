Rails.application.routes.draw do
  resources :mailinglists
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
  get 'nieuwsbrieven', to: 'nieuwsbrieven#index'
  get 'nieuwsbrieven/:slug', to: 'nieuwsbrieven#show'
  post 'nieuwsbrieven', to: 'nieuwsbrieven#subscribe_to_mailinglist'
  get 'nieuwsbrieven/:uuid/afmelden', to: 'nieuwsbrieven#unsubscribe_from_mailinglist'
  get 'vacatures', to: 'vacatures#index'

  get '/sitemap.xml.gz', to: redirect("https://s3-#{Rails.application.credentials.aws[:region]}.amazonaws.com/#{Rails.application.credentials.aws[:bucket]}/sitemap.xml.gz")

  # redirect some old articles
  get '/2020/05/15/informatie-dagen', to: redirect('/nieuws/informatie-dagen')
  get '/2020/05/12/opendag-gaat-niet-door', to: redirect('/nieuws/opendag-gaat-niet-door')
  get '/2020/03/12/nl-doe-dag', to: redirect('/nieuws/nl-doe-dag')
  get '/2020/03/05/resultaat-van-de-verbouwing', to: redirect('/nieuws/resultaat-van-de-verbouwing')
  get '/2020/02/28/update-school-de-hofakker-in-de-verbouwing', to: redirect('/nieuws/update-school-de-hofakker-in-de-verbouwing')
  get '/2020/02/25/school-de-hofakker-in-de-verbouwing', to: redirect('/nieuws/school-de-hofakker-in-de-verbouwing')
  get '/2020/02/12/tafel-kleuterklas', to: redirect('/nieuws/tafel-kleuterklas')
  get '/2019/10/07/michaelsfeest-op-de-hofakker', to: redirect('/nieuws/michaelsfeest-op-de-hofakker')
  get '/2019/08/02/update-meester-hans-moet-weer-naar-school', to: redirect('/nieuws/update-meester-hans-moet-weer-naar-school')
  get '/2019/07/14/meester-hans-moet-weer-naar-school', to: redirect('/nieuws/meester-hans-moet-weer-naar-school')
  get '/2019/05/01/school-de-hofakker-op-radio-gelderland', to: redirect('/nieuws/school-de-hofakker-op-radio-gelderland')
  get '/2019/04/14/school-de-hofakker-onder-de-aandacht-in-tijdschrift-vrije-opvoedkunst', to: redirect('/nieuws/school-de-hofakker-onder-de-aandacht-in-tijdschrift-vrije-opvoedkunst')
  get '/2019/04/11/open-dag-2019-de-hofakker-school/', to: redirect('/nieuws/open-dag-2019')
  get '/2020/03/03/aankondiging-open-dag-2020/', to: redirect('/nieuws/open-dag-2020')
end
