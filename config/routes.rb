Rails.application.routes.draw do
  devise_for :users, :controllers => {:registrations => 'registrations'}
  root to: "home#index"

  resources :tests do
    collection do
      get :activate_test
      get :deactivate_test
      get :complete_test
      get :completed_tests
      get :current_exam
      post :submit_exam
    end
  end
  resources :multiple_choice_questions
  
end
