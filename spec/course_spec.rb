require './lib/course'
require 'rspec'

RSpec.describe Course do
  before(:each) do
    @course = Course.new("Calculus", 2)
    @student1 = Student.new({name: "Morgan", age: 21})
    @student2 = Student.new({name: "Jordan", age: 29}) 
  end
  it 'exists' do
  expect(@course).to be_an_instance_of(Course)
  end

  it 'has attributes' do
    expect(@course.name).to eq("Calculus")
    expect(@course.capacity).to eq(2)
    expect(@course.students).to eq([])
  end

  it 'enrolls students' do
    @course.enroll(@student1)
    @course.enroll(@student2)

    expect(@course.students).to eq([@student1, @student2])
  end

  it 'tests full' do
    course_1 = Course.new("Science", 3)
    @course.enroll(@student1)
    @course.enroll(@student2)

    expect(course_1.full?).to eq(false)
    expect(@course.full?).to eq(true)
  end
end