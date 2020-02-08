class Hand
  attr_accessor :score, :hand

  def initialize
    @hand = []
    @score = 0
  end

  def take_card!(deck)
    @hand << deck.take
  end

  def score
    score_ace
  end

  def show_cards
    @hand.each { |card| puts "(#{card.face}-#{card.suit})" }
  end

  def show_shadow_cards
    @hand.each { |card| puts '(**-**)' }
  end

  private

  def score_ace
    score = 0
    hand.each do |card|
      score += card.value
      score += 10 if card.value == 1 && score + 10 <= 21
    end
    score
  end
end
