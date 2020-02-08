# frozen_string_literal: true

class User < Player
  attr_accessor :name, :cash, :hand

  def initialize
    super
    @name = set_name!
  end

  private

  def set_name!
    puts 'Введите ваше имя'
    self.name = gets.chomp.to_s.capitalize!
  end
end
