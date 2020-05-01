Rails.application.routes.draw do

  mount RailsAdmin::Engine => '/admin', as: 'rails_admin'
  root 'home#top'
  get 'home/top'
  get 'home/about'
  get 'home/thanks'
  get 'home/inquiry'

  devise_for :users, controllers: {
    registrations: 'users/registrations',
    sessions: "users/sessions",
  }

  resources :users, only: [:show, :edit, :update] do
  	get 'withdrawal', on: :collection
  end

  resources :requests do
  	get 'schedule', on: :collection
  	get 'promised_match', on: :collection
  	get 'map', on: :member
  end

end
