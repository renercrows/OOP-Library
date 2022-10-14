require './person'

class Student < Person
  attr_reader :classroom

  def initialize(age, name, parent_permission, classroom)
    super(age, name, parent_permission)
    @classroom = classroom
  end

  def play_hooky
    "¯\(ツ)/¯"
  end

  def classroom=(classroom)
    classroom.student.push(self) unless classroom.animals.include?(self)
    @classroom = classroom
  end
end
