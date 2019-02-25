class Course < ApplicationRecord
    
    validates :short_name, presence: true, length: {minimum: 3, maximum: 10}
    validates :name, presence: true, length: { minimum: 5, maximu: 20}
    validates :description, presence: true, length: {minimum: 10, maximum: 60}
    
    has_many :student_courses
    has_many :students, through: :student_courses
    
end