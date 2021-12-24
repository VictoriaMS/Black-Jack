class Dealer
  def initialize
    @cash = 100 
    @cards = []
    @poin = 0 
  end

  def take_card(card)
    cards << card if cards.count == 2
  end

  def place_bet 
    self.cash -= 10
  end
end
