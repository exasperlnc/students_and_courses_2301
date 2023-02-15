require_relative 'student'

class Course
  attr_reader :name, :capacity, :students
  def initialize(name, capacity)
    @name = name
    @capacity = capacity
    @students = students
    @students = []
  end

  def enroll(student)
    @students << student
  end

  def full?
    @students.count >= @capacity
  end
end
