# frozen_string_literal: true
require_relative 'requirable'

class Game
  INTERFACE = [
    '1. Skip',
    '2. Add a card',
    '3. Open cards'
  ].freeze

  attr_reader :dealer, :player
  attr_accessor :move, :bank, :deck

  def initialize
    @deck = Deck.new
    @bank = 0
    @dealer = Dealer.new
  end

  def start
    greeting
    game
  end

  def game
    deal_cards
    place_bets
    current_status
    logic_game
    find_winner
    play_again
  end

  def greeting
    puts 'Welcome! What is your name?'
    @player = Player.new(gets.chomp)
    self.move = player
  end

  def deal_cards
    puts 'Deal cards...'
    2.times do
      player.take_card(deck.issue_card)
      dealer.take_card(deck.issue_card)
    end
    sleep 1
  end

  def place_bets
    player.place_bet
    dealer.place_bet
    self.bank += 20
  end

  def logic_game
    loop do
      break open_cards if dealer.cards.count == 3 && player.cards.count == 3

      if move == player
        puts INTERFACE
        input = gets.chomp.to_i
        case input
        when 1
          self.move = dealer
        when 2
          player.take_card(deck.issue_card)
          current_status
          self.move = dealer
        when 3
          open_cards
          break
        end
      else
        dealer_move
      end
    end
  end

  def open_cards
    puts '-------------------------------------------'
    puts "Dealer's cards: #{dealer.cards.map(&:name)}"
    puts "Dealer's point: #{dealer.point}"
    puts "Your cards: #{player.cards.map(&:name)}"
    puts "Your point: #{player.point}"
    puts '-------------------------------------------'
  end

  def current_status
    puts '---------------------------------------'
    puts "Dealer's cards: #{dealer.hidden_cards}"
    puts "Your cards: #{player.show_cards}"
    puts "Your point #{player.point}"
    puts '--------------------------------------'
  end

  def find_winner
    if (dealer.point > 21 && player.point > 21) || (dealer.point == 21 && player.point == 21)
      puts 'Dead head!'
      self.bank = 0
      dealer.cash += 10
      player.cash += 10
    elsif dealer.point == 21 || player.point > 21
      dealer_win
    elsif player.point == 21 || dealer.point > 21 || 21 - player.point < 21 - dealer.point
      puts 'You are win!'
      player.cash += 20
      self.bank = 0
    else
        dealer_win
    end
  end

  def reset_all
    player.fold_cards
    dealer.fold_cards
    self.deck = Deck.new
  end

  def play_again
    puts 'Do you want to play again?'
    puts '1. Yes'
    puts '2. No'
    input = gets.chomp.to_i
    if input == 1
      reset_all
      game
    else
      puts "Goodbye #{player.name} "
    end
  end
  
  def dealer_win
    puts 'Dealer is win!'
    dealer.cash += 20
    self.bank = 0
  end

  def dealer_move
    puts 'DEALER MOVE'
    if dealer.point <= 18
      dealer.take_card(deck.issue_card)
      puts "Dealer's cards: #{dealer.hidden_cards}"
      self.move = player
    else
      puts 'Dealer skip move.'
      self.move = player
    end
  end
end


Game.new.start
