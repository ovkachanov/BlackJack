class Player
  attr_reader :name
  attr_accessor :cash

  def initialize(name)
    @name = name
    @cash = 100
    @hand = Hand.new
  end

  def get_bet
    self.cash += 10
  end

  def give_bet
    self.cash -= 10
  end

  private

  def set_name!
    puts 'Введите ваше имя'
    self.name = gets.chomp.capitalize!
  end
end
