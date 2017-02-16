Rails.application.routes.draw do

  resources :conferences

  root                    :controller => 'static_pages',    :action => 'home'
  get       '/home',      :controller => 'static_pages',    :action => 'home'
  get       '/help',      :controller => 'static_pages',    :action => 'help'

  get       '/signup',    :controller => 'users',           :action => 'new'
  post      '/signup',    :controller => 'users',           :action => 'create'

  get       '/login',     :controller => 'sessions',        :action => 'new'
  post      '/login',     :controller => 'sessions',        :action => 'create'
  delete    '/logout',    :controller => 'sessions',        :action => 'destroy'

  get       '/new_conf',  :controller => 'conferences',     :action =>  'new'
  post      '/new_conf',  :controller => 'conferences',     :action =>  'create'

  get       '/search',    :controller => 'conferences',     :action =>  'index'

  resources :users

end
