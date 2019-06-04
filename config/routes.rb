Rails.application.routes.draw do
  devise_for :users
  root to: 'pages#home'
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
  resources :courses do 
    resources :subscriptions do 
      resources :subscription_words
    end
  end

  get 'dashboards', to: 'dashboards#account'
end
