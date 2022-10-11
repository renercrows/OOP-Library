require './base_decorator'

class CapitalizeDecorator < Base_decorator
  def correct_name
    @nameable.correct_name.capitalize
  end
end
