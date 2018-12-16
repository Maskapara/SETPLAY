Rails.application.routes.draw do
  
  get '/' => 'home#top'
  get '/home/top' => 'home#top'
  get '/home/plan' => 'home#plan'
  get '/home/plan/:id' => 'home#show'

  post '/home/create' => 'home#create'
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end
