Tritracker2::Application.routes.draw do
  devise_for :users
  root to: "pages#index"
  get '/home', to: "pages#home", as: 'home'
  get "/workouts", to: "workouts#index", as: 'workouts'
end
