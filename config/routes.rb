Rails.application.routes.draw do
  
  get '/' => 'home#top'
  get '/account' => 'home#account_create'
  get '/login' => 'home#login_form'
  get '/home/top' => 'home#top'
  get '/home/plan' => 'home#plan'
  get '/home/plan/:id' => 'home#show'
  get '/home/edit/:id' => 'home#edit'
  
  post '/account' => 'home#A_create'
  post '/login' => 'home#login'
  post '/logout' => 'home#logout'
  post '/home/edit_post/:id' => 'home#edit_post'
  post '/home/delete/:id' => 'home#delete'
  post '/home/create' => 'home#create'
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end
