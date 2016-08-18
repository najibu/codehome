Rails.application.routes.draw do
  devise_for :users, :controllers => { :sessions => "sessions", :registrations => 'registrations'}
  
  resources :courses do
    resources :chapters
  end

  resources :schools

  #Progresses
  get 'chapter/read' => 'progresses#show'
  post 'chapters/mark_as_complete' => 'progresses#create'
  delete 'chapters/mark_as_incomplete' => 'progresses#destroy'

  # Users
  get '/my_current_user' => 'user#my_current_user'
  match 'users/:id' => 'user#update_user', via: [:patch]  
  get '/send_password' => 'users#reset_password'

end
