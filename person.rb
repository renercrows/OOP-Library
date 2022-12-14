require './nameable'
require './base_decorator'
require './capitalize_decorator'
require './trimmer_decorator'
require './rental'

class Person < Nameable
  attr_reader :id, :rentals
  attr_accessor :name, :age

  def initialize(age, name, parent_permission)
    super()
    @id = Random.rand(1...1000)
    @name = name
    @age = age
    @parent_permission = parent_permission
    @rentals = []
  end

  def correct_name
    @name
  end

  def can_use_services?
    of_age? || @parent_permission
  end

  def add_rental(rental)
    @rentals.push(rental)
  end

  private

  def of_age?
    @age >= 18
  end
end
