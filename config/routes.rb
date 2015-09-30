Rails.application.routes.draw do
  
  resources :players do
    member do
      post :update_work_schedule
    end
  end
  
  resources :games do
    member do
      post :assign_players
      post :continue_game
    end
  end

  devise_for :users, :path => '', :path_names => {:sign_in => 'login', :sign_out => 'logout', :sign_up => 'create_account'}
  get "demo_screenshots" => "pages#demo_screenshots"
  root 'pages#home'


  # Example of named route that can be invoked with purchase_url(id: product.id)
  #   get 'products/:id/purchase' => 'catalog#purchase', as: :purchase

  # Example resource route with options:
  #   resources :products do
  #     member do
  #       get 'short'
  #       post 'toggle'
  #     end
  #
  #     collection do
  #       get 'sold'
  #     end
  #   end

  # Example resource route with sub-resources:
  #   resources :products do
  #     resources :comments, :sales
  #     resource :seller
  #   end

end
