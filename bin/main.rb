#!/usr/bin/env ruby

require '../app'

class Main
  attr_reader :app

  def initialize
    puts 'Welcome to School Library App!'
    @app = App.new
    show_menu
  end

  def show_menu
    puts ''
    puts "Please choose an option by entering a number:
  1 - List all books
  2 - List all people
  3 - Create a person
  4 - Create a book
  5 - Create a rental
  6 - List all rentals for a given person id
  7 - Exit"
    user_selection
  end

  # rubocop:disable Metrics/CyclomaticComplexity
  # rubocop:disable Metrics/MethodLength
  def user_selection
    selection = gets.chomp.to_i
    case selection
    when 1
      app.list_all_books
      show_menu
    when 2
      app.list_all_people
      show_menu
    when 3
      app.add_person
      show_menu
    when 4
      app.add_book
      show_menu
    when 5
      app.rent_book
      show_menu
    when 6
      app.list_rentals
      show_menu
    when 7
      abort('Thank you for using this app!')
    else
      puts 'Invalid selection'
      show_menu
    end
  end
  # rubocop:enable Metrics/CyclomaticComplexity
  # rubocop:enable Metrics/MethodLength
end

Main.new
