require './base_decorator'

class CapitalizeDecorator < Base_Decorator
  def correct_name
    @nameable.correct_name.capitalize
  end
end
