Rails.application.routes.draw do
  
  resources :measure_austins

  resources :players do
    member do
      post :update_work_schedule
      post :update_measure_austin
      post :update_measure_lewis
    end
  end
  
  resources :games do
    member do
      post :assign_players
      post :complete_game
      post :continue_game
      post :generate_forms
    end
  end

  devise_for :users, :path => '', :path_names => {:sign_in => 'login', :sign_out => 'logout', :sign_up => 'create_account'}
  
  get "demo_screenshots" => "pages#demo_screenshots"
  get "tutorial" => "pages#tutorial"
    post "activate_user" => "pages#activate_user"
  root 'pages#home'

end
