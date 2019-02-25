Rails.application.routes.draw do
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
  
  root "courses#index"
  get 'courses/new', to: 'courses#new'
  get 'courses/info/:id', to: 'courses#info'
  
  get 'about', to: 'pages#about'
  resources :students, except: [:destroy]
  get 'login', to: 'logins#new'
  post 'login', to: 'logins#create'
  delete 'logout', to: 'logins#logout'
  post 'course_enroll', to: 'student_courses#create'
end
