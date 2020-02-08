class Card
  attr_reader :suit, :face
  attr_accessor :value

  def initialize(suit, face)
    @suit = suit
    @face = face
    @value = value
  end

  def value
   return 10 if %w(J Q K).include?(face)
   return 1 if face == 'A'
   face
  end
end
