Rails.application.routes.draw do
  root 'pages#index'
  get '/add' => 'pages#add', as: 'add'
  post '/add' => 'pages#create'
  get '/:name/add' => 'pages#add_subpage', as: 'add_subpage', param: :name
  post '/:name/add' => 'pages#create_subpage', param: :name
  get '/:name' => "pages#show", as: 'show', param: :name
  get '/:name/edit' => 'pages#edit', as: 'edit', param: :name
  patch '/:name/edit' => 'pages#update', param: :name
  delete '/:name' => 'pages#destroy', as: 'destroy', param: :name
end
