# frozen_string_literal: true

class Deck
  attr_reader :deck

  def initialize
    @deck = create_deck
  end

  def create_deck
    deck = []
    ['♠', '♥', '♣', '♦'].each do |suit|
      (2..10).to_a.push('J', 'Q', 'K', 'A').each do |face|
        deck << Card.new(suit, face)
      end
    end
    deck.shuffle
  end

  def take
    @deck.shift
  end
end
