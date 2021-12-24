class Player 

  attr_reader :name, :cards
  attr_accessor :cash 

  def initialize(name) 
    @name = name 
    @cash = 100
    @cards = []
    @point
  end

  def take_card(card)
    cards << card if cards.count <= 2
  end

  def place_bet 
    self.cash -= 10
  end

end
