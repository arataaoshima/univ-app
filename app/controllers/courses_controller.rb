class CoursesController < ApplicationController
    
    skip_before_action :require_user, only: [:index, :info]
    
    def index
        @courses = Course.all
    end
    
    def new
    end
    
    def info
        @course = Course.find(params[:id])
    end
    
end