require_relative 'course'

class Gradebook
attr_reader :instructor, :courses, :all_students
  def initialize(gradebook_attributes)
    @courses = gradebook_attributes[:courses]
    @instructor = gradebook_attributes[:instructor]
    @courses = []
    @all_students = gradebook_attributes[:all_students]
    @all_students = {}
  end

  def add_course(course)
    @courses << course
    @all_students.store(course.name, course.students)
  end

  def list_all_students
    @all_students
  end

  def students_below(threshold)
    holding_cell = []
    @all_students.each do |key, value| 
      value.each do |student|
        if student.grade < threshold
          holding_cell << student
        end
      end
    end
    return holding_cell
  end

  def show_grades
    hash = {} 
    @all_students.each do |key, value|
      value.each do |student|
        hash.store(student.name, student.scores)
      end
       return hash
    end
  end
end