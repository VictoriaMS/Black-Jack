class Deck 
  CARD_VALUE = %w{2 3 4 5 6 7 8 9 10 K Q J A}
  
  attr_reader :cards

  def initialize
    @cards = []
    new_deck
  end 

  def new_deck
    CARD_VALUE.each do |value|

      cards << Card.new((value + "\u{2660}"), value.to_i)
      cards << Card.new((value + "\u{2666}"), value.to_i)
      cards << Card.new((value + "\u{2665}"), value.to_i)
      cards << Card.new((value + "\u{2663}"), value.to_i)

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
