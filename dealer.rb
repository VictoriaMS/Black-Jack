class Dealer < User
  def hidden_cards
    '*' * cards.count
  end
end
