require_relative './person'

class Teacher < Person
  def initialize(specialization:, **options)
    super(**options)
    @specialization = specialization
  end

  def can_use_services?
    true
  end
end
