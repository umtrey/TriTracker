Tritracker2::Application.routes.draw do
  devise_for :users
  root to: "pages#index"
  get '/home', to: "pages#home", as: 'home'

  get "/workouts/new", to: "workouts#new", as: 'new_workout'
  get "/workouts", to: "workouts#index", as: 'workouts'
  post "/workouts", to: "workouts#create"
end
