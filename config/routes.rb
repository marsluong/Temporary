Rails.application.routes.draw do
  devise_for :users, :controllers => {:registrations => 'registrations'}
  root to: "home#index"

  resources :tests do
    collection do
      get :activate_test
      get :deactivate_test
      get :complete_test
      get :completed_tests
    end
  end
  resources :multiple_choice_questions
  resources :descriptive_questions

  
end
