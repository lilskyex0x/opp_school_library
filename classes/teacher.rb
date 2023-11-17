require './classes/person'

class Teacher < Person
  attr_accessor :specialization, :parent_permission

  def initialize(specialization:, age: nil, name: 'Unknown', parent_permission: true)
    super(age: age, name: name, parent_permission: parent_permission)
    @specialization = specialization
  end

  def can_use_services?
    true
  end

  def to_json(*_args)
    {
      'id' => id,
      'age' => @age,
      'name' => @name,
      'parent_permission' => @parent_permission,
      'specialization' => @specialization
    }.to_json
  end
end
