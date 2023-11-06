class Person
  attr_reader :id
  attr_accessor :name, :age

  def initilaize(age, name: 'Unknown', parent_permission: true)
    @id = Random.rand(1..1000)
    @age = age
    @name = name
    @parent_permission = parent_permission
  end

  def of_age?
    return true if age >= 18

    false
  end
end
