require './person'
require './classroom'

class Student < Person
  attr_accessor :classroom

  def initialize(classroom:, age:, parent_permission: true, name: 'Unknown')
    super(age, name: name, parent_permission: parent_permission)
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

  def to_h
    {
      _class: self.class.name,
      object_id: object_id,
      id: @id,
      name: @name,
      age: @age,
      parent_permission: @parent_permission,
      rentals: @rentals,
      classroom: @classroom
    }
  end
end
