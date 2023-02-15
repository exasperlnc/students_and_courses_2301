require './lib/student'
require 'rspec'

RSpec.describe Student do
  before(:each) do 
    student = Student.new({name: "Morgan", age: 21})
  it 'exists' do
    expect(student).to be_an_instance_of(Student)
  end

  it 'has attributes' do
    expect(student.name).to eq("Morgan")
    expect(student.age).to eq("Morgan")
    expect(student.grade).to eq("Morgan")
  end

  it 'keeps score' do
    student.log_score(89)
    student.log_score(78)

    expect(student.scores).to eq([89,78])
  end

  it 'averages score' do 
    student.log_score(89)
    student.log_score(78)

    expect(student.grade).to eq(83.5)
end