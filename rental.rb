class Rental
  attr_accessor :date

  def initialize(date, person, book)
    @date = date
    @book = book
    @person = person
    @person.rentals << self
    @book.rentals << self
  end
end
