require './nameable'

class Decorator < Nameable
    attr_accessor :nameable

  def initilaize(nameable)
    @nameable = nameable
  end
end
