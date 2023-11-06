require './person'

class Teacher < Person
  def initilaize(specialization, age, name: 'Unknown', parent_permission: true)
    super(age, name: name, parent_permission: parent_permission)
    @specialization = specialization
  end
end
