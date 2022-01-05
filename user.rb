class User
  attr_accessor :cash, :point, :cards

  def initialize
    @cash = 100
    @cards = []
    @point = 0
  end

  def take_card(card)
    cards << card if cards.count <= 2
    count_points(card)
  end

  def place_bet
    self.cash -= 10
  end

  def count_points(card)
    card.value = 11 if card.name.include?('A') && point <= 10
    card.value = 1 if card.name.include?('A') && point > 10

    self.point += card.value
  end

  def show_cards
    cards.map(&:name)
  end

  def fold_cards
    self.cards = []
    self.point = 0
  end
end
