class Person
  def initialize(age, name = 'Unknown', parent_permission: true)
    @id = Random.rand(1..1000)
    @name = name
    @age = age
    @parent_permission = parent_permission
  end

  attr_accessor :name, :age
  attr_reader :id

  def of_age?
    @age >= 18
  end
  private :of_age?

  def can_use_services?
    of_age? or @parent_permission ? true : false
  end
end