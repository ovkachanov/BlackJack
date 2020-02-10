# frozen_string_literal: true

class User < Player
  attr_reader :cash
  attr_accessor :name, :hand

  def initialize
    @name ||= name
    super
  end
end
