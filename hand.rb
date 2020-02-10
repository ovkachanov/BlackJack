# frozen_string_literal: true

class Hand
  attr_accessor :card_collection

  def initialize
    @card_collection = []
    @score = 0
  end

  def take_card!(deck)
    @card_collection << deck.take
  end

  def score
    score_ace
  end

  private

  def score_ace
    score = 0
    card_collection.each do |card|
      score += card.value
      score += 10 if card.value == 1 && score + 10 <= 21
    end
    score
  end
end
