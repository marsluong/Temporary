Rails.application.routes.draw do
  devise_for :users, :controllers => {:registrations => 'registrations'}
  devise_scope :user do get "/registrations/show" => "registrations_controller"
  end
  root to: "home#index"

  resources :tests do
    collection do
       get :activate_test
       get :deactivate_test
       get :current_exam
       post :submit_exam
    end
  end
  resources :multiple_choice_questions
  resources :descriptive_questions
    
end
