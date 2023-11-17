require './classes/person'
require './classes/classroom'

class Student < Person
  attr_accessor :classroom

  def initialize(classroom:, age: nil, parent_permission: true, name: 'Unknown')
    super(age: age, name: name, parent_permission: parent_permission)
    @classroom = classroom
  end

  def play_hooky
    '¯\(ツ)/¯'
  end

  def add_classroom(classroom)
    classroom.students.push(self) unless classroom.students.include?(self)
  end

  def can_use_services?
    of_age? || @parent_permission
  end

  def to_json(*_args)
    {
      'id' => id,
      'age' => @age,
      'name' => @name,
      'parent_permission' => @parent_permission,
      'classroom' => @classroom.label
    }.to_json
  end
end
