class Card 
  attr_reader  :name

  def initialize(name, value)
    @name = name 
    value.zero? ? @value = 10 : @value = value
  end
end
