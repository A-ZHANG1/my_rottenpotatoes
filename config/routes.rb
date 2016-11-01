Rails.application.routes.draw do
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
  resources :movies
  root :to => redirect('/movies')
  
  # get  'auth/twitter/callback' => 'sessions#create',:as => 'login'
  # post 'logout' => 'sessions#destroy'
  # get  'auth/failure' => 'sessions#failure'
end
