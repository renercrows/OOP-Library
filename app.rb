require './book'
require './student'
require './person'
require './rental'
require './teacher'

class App
  def initialize
    @books = []
    @people = []
    @rentals = []
  end

  def menu
    puts "\nWelcome to Shool Library App!\n\n"
    puts 'Please choose an option by entering a number:'
    puts '1 - List all books'
    puts '2 - List all people'
    puts '3 - Create a person'
    puts '4 - Create a book'
    puts '5 - Create a rental'
    puts '6 - List all rentals for a given person id'
    puts '7 - Exit'
    gets.chomp
  end

  def options
    choose = menu
    case choose
    when '1'
      action_list_books
    when '2'
      action_list_people
    when '3'
      create_person
    when '4'
      create_book
    when '5'
      create_rental
    when '6'
      list_all_rentals
    else
      puts 'Come again soon!'
      exit
    end
  end

  def list_all_books
    if @books.length.positive?
      @books.each_with_index do |book, index|
        print "#{index}) Title: \"#{book.title}\", Author: #{book.author}\n"
      end
    else
      puts "No books here!"
    end
  end

  def action_list_books
    list_all_books
    puts "\nPress enter"
    gets.chomp
    options
  end

  def list_all_people
    if @people.length.positive?
      @people.each_with_index do |people, index|
        puts "#{index}) Name: #{people.name}, ID: #{people.id}, Age: #{people.age}"
      end
    else
      puts "No Student or Teachers here!"
    end
  end

  def action_list_people
    list_all_people
    puts "\nPress enter"
    gets.chomp
    options
  end

  def create_person
    print 'Do you want to create a student (1) or a teacher (2)? [Input the number]: '
    choice = gets.chomp
    case choice
    when '1'
      create_student
      puts "\nPerson created successfully\n"
    when '2'
      create_teacher
      puts "\nPerson created successfully\n"
    else
      puts "\nWrong answer"
    end
    options
  end

  def person_permission(the_person)
    case the_person
    when 'Y'
      true
    when 'N'
      false
    end
  end

  def create_teacher
    print 'Age: '
    age_of_teacher = gets.chomp
    print 'Name: '
    name_of_teacher = gets.chomp
    print 'Specialization: '
    specialization_of_teacher = gets.chomp
    teacher = Teacher.new(age_of_teacher, name_of_teacher, nil, specialization_of_teacher)
    @people.push(teacher)
  end

  def create_student
    print 'Age: '
    age_of_student = gets.chomp
    print 'Name: '
    name_of_student = gets.chomp
    print 'Has parent permission? [Y/N]: '
    parent_permission = gets.chomp
    student = Student.new(age_of_student, name_of_student, person_permission(parent_permission), nil)
    @people.push(student)
  end

  def create_book
    print 'Title: '
    title = gets.chomp
    print 'Author: '
    author = gets.chomp
    new_book = Book.new(title, author)
    @books.push(new_book)
    puts "\nBook created successfully\n"
    options
  end

  def create_rental
    if @books.length.positive?
      puts "\nSelect a book from the following list by number"
      list_all_books
      book_list = gets.chomp
      puts "\nSelect a person from the following list by number (not id)"
      list_all_people
      person_list = gets.chomp
      print "\n Date(yyyy/mm/dd): "
      date_of_rental = gets.chomp
      new_rental = Rental.new(date_of_rental, @books[book_list.to_i], @people[person_list.to_i])
      @rentals.push(new_rental)
      puts 'A rental got created'
      options
    else
      puts 'No books to rent'
    end
  end

  def list_all_rentals
    print "ID of person: "
    id_of_rental = gets.chomp
    puts "Rentals: "
    list_rentals_by_person_id(id_of_rental.to_i)
  end

  def list_rentals_by_person_id(id_of_rental)
    @rentals.each do |rental|
      if rental.person.id == id_of_rental
        puts "Date: #{rental.date}. Book: \"#{rental.book.title}\" by #{rental.book.author}"
      end
    end
    options
  end
end
