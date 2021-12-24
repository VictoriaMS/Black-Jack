class Card_deck 
  CARD_VALUE = %w{2, 3, 4, 5, 6, 7, 8, 9, 10, K, Q, J, A}
  
  attr_reader :cards

  def initialize
    @cards = []
    new_deck
  end 

  def new_deck
    CARD_VALUE.each do |n|
      cards << n + "\u{2660}"
      cards << n + "\u{2666}"
      cards << n + "\u{2665}"
      cards << n + "\u{2663}"
    end
    shufle_deck
  end

  def issue_card 
    cards.delete_at(0)
  end

  def shufle_deck
    cards.shuffle!
  end

end
