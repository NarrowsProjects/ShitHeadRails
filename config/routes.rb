Rails.application.routes.draw do
  resources :cards
  resources :games
  resources :players
  resources :piles
  get 'rules/cards'
  get 'rules/phase'
  get 'game/tutorial'
  get 'game/rules'
  # Define your application routes per the DSL in https://guides.rubyonrails.org/routing.html

  # Reveal health status on /up that returns 200 if the app boots with no exceptions, otherwise 500.
  # Can be used by load balancers and uptime monitors to verify that the app is live.
  get "up" => "rails/health#show", as: :rails_health_check
  root "front_page#frontpage"
  # Defines the root path route ("/")
  # root "posts#index"
end
