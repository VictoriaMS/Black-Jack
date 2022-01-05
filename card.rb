class Card
  attr_accessor :value
  attr_reader :name

  def initialize(name, value)
    @name = name
    @value = value.zero? ? 10 : value
  end
end
