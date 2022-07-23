require_relative './book'
require_relative './student'
require_relative './teacher'
require_relative './rental'

class App
  attr_reader :books, :people, :rentals

  def initialize
    @books = []
    @people = []
    @rentals = []
  end

  def list_all_books
    books.each { |book| puts "Title: #{book.title}, Author: #{book.author}" }
  end

  def list_all_people
    people.each { |person| puts "[#{person.class}] Name: #{person.name} ID: #{person.id} age: #{person.age}" }
  end

  # rubocop:disable Metrics/MethodLength
  def add_person
    print 'Do you want to create a student (1) or a teacher (2)? [Input the number]:'
    person = gets.chomp.to_i
    case person
    when 1
      type = 'student'
    when 2
      type = 'teacher'
    else
      puts 'Invalid selection'
    end
    print 'Age:'
    age = gets.chomp.to_i
    print 'Name:'
    name = gets.chomp
    case type
    when 'student'
      print 'Has parent permission? [Y/N]:'
      permission = (gets.chomp.upcase == 'Y')
      student = Student.new(classroom: nil, age: age, name: name, parent_permission: permission)
      people.push(student)
    when 'teacher'
      print 'specialization:'
      specialization = gets.chomp
      teacher = Teacher.new(specialization: specialization, age: age, name: name)
      people.push(teacher)
    else
      return
    end
    puts 'Person created successfully'
  end
  # rubocop:enable Metrics/MethodLength

  def add_book
    print 'Title:'
    title = gets.chomp
    print 'Author:'
    author = gets.chomp
    book = Book.new(title, author)
    books.push(book)
    puts 'Book created successfully'
  end

  def rent_book
    puts 'Select a book from the following list by number'
    books.each_with_index { |book, index| puts "#{index}) Title: #{book.title}, Author: #{book.author}" }
    book_index = gets.chomp.to_i
    puts 'Select a person from the following list by number (not id)'
    people.each_with_index do |person, index|
      puts "#{index}) [#{person.class}] Name: #{person.name} ID: #{person.id} age: #{person.age}"
    end
    person_index = gets.chomp.to_i
    print 'Date [YYYY/MM/DD]:'
    date = gets.chomp
    new_rent = Rental.new(date, people[person_index], books[book_index])
    rentals.push(new_rent)
    puts 'Rental created successfully'
  end

  def list_rentals
    puts 'ID of person:'
    person_id = gets.chomp.to_i
    puts 'Rentals:'
    rented_by_person = rentals.select do |rented|
      rented.person.id == person_id
    end
    rented_by_person.each { |rent| puts "Date: #{rent.date}, Book \"#{rent.book.title}\" by: #{rent.book.author}" }
  end
end
