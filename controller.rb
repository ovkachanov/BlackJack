# frozen_string_literal: true

class Controller
  attr_reader :user, :dealer, :deck, :interface

  def initialize
    @user = User.new
    @dealer = Dealer.new
    @deck = Deck.new
    @interface = Interface.new
  end

  def start
    interface.set_name(user)
    loop do
      run
      if user.hand.score == 21
        combinations
      else
        loop do
          interface.show_user_actions
          var = gets.chomp
          user_variable(var)
          break
        end
      end
      clear_cards
    end
  end

  private

  def run
    interface.info_new_game
    2.times { user.hand.take_card!(deck) }
    2.times { dealer.hand.take_card!(deck) }
    interface.show_user_info(user)
  end

  def clear_cards
    user.hand.card_collection.clear
    dealer.hand.card_collection.clear
  end

  def combinations
    show_winner_and_recount
    interface.show_name_cash_info(user, dealer)
  end

  def show_winner_and_recount
    interface.output_draw(user, dealer) if user.hand.score == dealer.hand.score && dealer.hand.score < 21

    if dealer.hand.score <= 21 && (dealer.hand.score > user.hand.score || user.hand.score > 21)
      interface.output_win(dealer)
      user.give_bet
      dealer.get_bet
    end

    if user.hand.score <= 21 && (user.hand.score > dealer.hand.score || dealer.hand.score > 21)
      interface.output_win(user)
      user.get_bet
      dealer.give_bet
    end
  end

  def user_variable(var)
    if var == '1'
      logic_take_card
      if user.hand.score >= 21
        combinations
      end
    elsif var == '2'
      combinations
    end
  end

  def logic_take_card
    user.hand.take_card!(deck)
    interface.show_user_info(user)
    interface.show_cards(user)
  end
end
