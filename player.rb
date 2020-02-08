class Player
  attr_reader :name
  attr_accessor :money, :cards, :score

  def initialize(name)
    @name = name
    @money = 100
    @cards = []
    @score = 0
  end

  def skip_move
  end

  def add_card
  end

  def open_cards
  end
end
