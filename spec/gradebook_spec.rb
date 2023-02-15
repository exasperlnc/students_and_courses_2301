require './lib/gradebook'
require 'rspec'

RSpec.describe Gradebook do
  before(:each) do
    @gradebook = Gradebook.new({:instructor => "Logan"})
    @course1 = Course.new("Calculus", 2)
    @course2 = Course.new("Science", 3)
    @student1 = Student.new({name: "Morgan", age: 21})
    @student2 = Student.new({name: "Jordan", age: 29})
    @student3 = Student.new({name: "Matt", age: 27}) 
    @course1.enroll(@student1)
    @course1.enroll(@student2)
    @course2.enroll(@student3)
  end

  it 'exists' do
    expect(@gradebook).to be_an_instance_of(Gradebook)
  end

  it 'has attributes' do
    expect(@gradebook.instructor).to eq('Logan')
    expect(@gradebook.courses).to eq([])
  end

  it 'adds courses' do
    @gradebook.add_course(@course1)
    @gradebook.add_course(@course2)

    expect(@gradebook.courses).to eq([@course1, @course2])
  end

  it 'lists all students' do
    @gradebook.add_course(@course1)
    @gradebook.add_course(@course2)

    expect(@gradebook.list_all_students).to eq({"#{@course1.name}" => [@student1, @student2], "#{@course2.name}" => [@student3]})
  end

  it 'lists students below' do
    @student1.log_score(15)
    @student2.log_score(100)
    @gradebook.add_course(@course1)
    @gradebook.add_course(@course2)

    expect(@gradebook.students_below(20)).to eq([@student1])
  end
end