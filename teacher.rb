require './person'

class Teacher < Person
  def initialize(specialization:, age:, name: 'Unknown', parent_permission: true)
    super(age, name: name, parent_permission: parent_permission)
    @specialization = specialization
  end

  def can_use_services?
    true
  end

  def to_h
    {
      _class: self.class.name,
      object_id: object_id,
      id: @id,
      name: @name,
      age: @age,
      specialization: @specialization,
      parent_permission: @parent_permission,
      rentals: @rentals
    }
  end
end
