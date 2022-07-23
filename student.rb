require_relative './person'

class Student < Person
  def initialize(classroom:, **options)
    super(**options)
    @classroom = classroom
  end

  def play_hooky
    '¯\(ツ)/¯'
  end

  def join_classroom(classroom)
    @classroom = classroom
    classroom.add_student(self)
  end
end
