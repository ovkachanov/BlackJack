# frozen_string_literal: true

class Player
  attr_reader :name
  attr_accessor :cash

  def initialize
    @cash = 100
    @hand = Hand.new
  end

  # rubocop:disable Naming/AccessorMethodName
  def get_bet
    self.cash += 10
  end

  def give_bet
    self.cash -= 10
  end
  # rubocop:enable Naming/AccessorMethodName
end
