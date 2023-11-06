class Person
  attr_reader :id
  attr_accessor :name, :age

  def initilaize (age, name: "Unknown", parent_permission: true)
    @id = Random.rand(1..1000)
    @age = age
    @name = name 
    @parent_permission = parent_permission
  end
end