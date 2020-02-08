class Controller
  attr_reader :user, :dealer, :deck

  def initialize
    @user = User.new
    @dealer = Dealer.new
    @deck = Deck.new
  end

  def start
    loop do
      puts "Выберите действие:\n1.Играть в BlackJack\n2.Выйти из игры"
      choice = gets.chomp.to_i

      if choice == 2
        exit
      elsif choice == 1
        run
        if user.hand.score == 21
          combinations
        else
          loop do
            print "1 - Взять карту\n2 - Пропустить ход\n"
            var = gets.chomp
            if var == '1'
              user.hand.take_card!(deck)
              puts "#{user.name} очки: #{user.hand.score}"
              user.hand.show_cards
              if user.hand.score >= 21
                combinations
                break
              end
            end
            if var == '2'
              combinations
              break
            end
          end
        end
        clear_cards
      end
    end
  end

  private

  def run
    puts "=======================\n#{user.name} - Игра началась!!!"
    2.times { user.hand.take_card!(deck) }
    2.times { dealer.hand.take_card!(deck) }
    show_info
  end

  def show_info
    puts "#{user.name} очки: #{user.hand.score}"
    user.hand.show_cards
    puts 'Dealer очки: **'
    dealer.hand.show_shadow_cards
  end

  def clear_cards
    user.hand.hand.clear
    dealer.hand.hand.clear
  end

  def combinations
    option_one
    option_two
    option_three
    puts "#{user.name} $: #{user.cash}"
    puts "#{dealer.name} $: #{dealer.cash}"
    puts '________________________________'
  end

  def option_one
    puts "#{user.name}, у Вас BlackJack" if user.hand.score == 21
    puts 'Dealer BlackJack!' if dealer.hand.score == 21
  end

  def option_two
    if user.hand.score <= 21
      dealer.hand.take_card!(deck) while dealer.hand.score < 18
    elsif user.hand.score <= 21 && dealer.hand.score > 21
      puts "#{user.name} WIN!"
      user.get_bet
      dealer.give_bet
    end
  end

  def option_three
    if user.hand.score == dealer.hand.score
      puts "Draw\n #{user.name}:#{user.hand.score} = dealer:#{dealer.hand.score}"
    else
      puts 'Dealer WIN!'
      user.give_bet
      dealer.get_bet
    end
  end
end
