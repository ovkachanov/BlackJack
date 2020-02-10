# frozen_string_literal: true

class Deck
  attr_reader :game_deck

  def initialize
    @game_deck = create_deck
  end

  def create_deck
    game_deck = []
    Card::SUITS.each do |suit|
      (2..10).to_a.push('J', 'Q', 'K', 'A').each do |face|
        game_deck << Card.new(suit, face)
      end
    end
    game_deck.shuffle
  end

  def take
    @game_deck.shift
  end
end
