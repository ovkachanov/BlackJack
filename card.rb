# frozen_string_literal: true

class Card
  SUITS = ['♠', '♥', '♣', '♦'].freeze
  FACES = (2..10).to_a.push('J', 'Q', 'K', 'A').freeze

  attr_reader :suit, :face

  def initialize(suit, face)
    @suit = suit
    @face = face
    @value = value
  end

  def value
    return 10 if %w[J Q K].include?(face)
    return 1 if face == 'A'

    face
  end
end
