require './lib/gradebook'
require 'rspec'

RSpec.describe Gradebook do
  before(:each) do
    @gradebook = Gradebook.new
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

  xit 'has attributes' do
    expect(@gradebook.instructor).to eq('Logan')
    expect(@gradebook.courses).to eq([])
  end

  xit 'adds courses' do
    @gradebook.add_course(@course1)
    @gradebook.add_course(@course2)

    expect(@gradebook.courses).to eq([@course1, @course2])
  end

  xit 'lists all students' do
    @gradebook.add_course(@course1)
    @gradebook.add_course(@course2)

    # expect(@gradebook.list_all_students).to eq({:@course1 [@student1, @student2] :@course2 [student3]})
  end
end