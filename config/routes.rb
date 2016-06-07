Rails.application.routes.draw do

  resources :measure_austins

  resources :players do
    member do
      post :update_work_schedule
      post :update_measure_austin
      post :update_measure_lewis
      post :update_measure_workload
      post :go_offline
    end
  end

  resources :games do
    member do
      post :assign_players
      post :complete_game
      post :continue_game
      post :generate_forms
      post :generate_results
    end
  end

  devise_for :users, path: '', :path_names => { :sign_in => 'login', :sign_out => 'logout', :sign_up => 'create_account' }
  
  get "demo_screenshots" => "pages#demo_screenshots"

  post "activate_user" => "pages#activate_user"
  post "activate_tut0" => "pages#activate_tut0"
  post "activate_tut1" => "pages#activate_tut1"
  post "activate_tut2" => "pages#activate_tut2"
  post "activate_tut3" => "pages#activate_tut3"
  post "go_offline_now" => "pages#go_offline_now"
  post "inactivate_user" => "pages#inactivate_user"
  
  root 'pages#home'
end
