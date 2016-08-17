Rails.application.routes.draw do
  devise_for :users, :controllers => { :sessions => "sessions", :registrations => 'registrations'}
  # Users
  get '/my_current_user' => 'user#my_current_user'
  match 'users/:id' => 'user#update_user', via: [:patch]  
  get '/send_password' => 'users#reset_password'
end
