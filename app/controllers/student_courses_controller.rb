class StudentCoursesController < ApplicationController
    
    def create
        course_to_add = Course.find(params[:course_id])
        unless current_user.courses.include?(course_to_add)
            StudentCourse.create(student_id: current_user.id, course_id: course_to_add.id)
            flash[:notice] = "You have successfully enrolled #{course_to_add.name}"
            redirect_to current_user
        else
            flash[:notice] = "Something was wrong with your enrollment"
            redirect_to roo_path
        end
    end
    
end