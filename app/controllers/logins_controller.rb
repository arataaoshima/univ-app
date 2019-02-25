class LoginsController < ApplicationController
    
    skip_before_action :require_user ,only: [:new, :create]
    
    def new
    end
    
    def create
      student = Student.find_by(email: params[:logins][:email].downcase)
      
      if student && student.authenticate(params[:logins][:password])
          
          session[:student_id] = student.id
          flash[:notice] = "You have successfully logged in"
          redirect_to student
      else
        flash.now[:notice] = "Something went wrong with your email or password"
        render 'new'
      end
    end
    
    def logout
        session[:student_id] = nil
        flash[:notice] = "You have successfully logged out"
        redirect_to login_path
        
    end
    
end