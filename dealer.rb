class Dealer < Player
  attr_accessor :name, :cash, :hand

  def initialize
    @name = 'Dealer'
    super
  end
end
