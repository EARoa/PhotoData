Rails.application.routes.draw do

  root 'photos#index'
  get '/photos/new', as: :new_photo
  post '/photos' => 'photos#create', as: :photos

  devise_for :users

end
