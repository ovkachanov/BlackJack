class Player
  attr_reader :name
  attr_accessor :cash

  def initialize
    @cash = 100
    @hand = Hand.new
  end

  def get_bet
    self.cash += 10
  end

  def give_bet
    self.cash -= 10
  end
end
