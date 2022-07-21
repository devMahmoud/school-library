class Classroom
  attr_accessor :label, :students

  @students = []

  def initialize(label)
    @label = label
  end

  def add_student(student)
    @students << student
    student.join_classroom(self)
  end
end
