# frozen_string_literal: true

class Controller
  include Interface

  attr_reader :user, :dealer, :deck

  def initialize
    @user = User.new
    @dealer = Dealer.new
    @deck = Deck.new
  end

  def start
    set_name(user)
    loop do
      run
      if user.hand.score == 21
        combinations
      else
        loop do
          show_user_actions
          var = gets.chomp
          if var == '1'
            logic_take_card
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
  # rubocop:enable

  private

  def run
    2.times { user.hand.take_card!(deck) }
    2.times { dealer.hand.take_card!(deck) }
    show_main_info(user, dealer)
  end

  def clear_cards
    user.hand.card_collection.clear
    dealer.hand.card_collection.clear
  end

  def combinations
    show_winner_and_recount
    show_name_cash_info(user, dealer)
  end

  def show_winner_and_recount
    output_draw(user, dealer) if user.hand.score == dealer.hand.score && dealer.hand.score < 21

    if dealer.hand.score <= 21 && (dealer.hand.score > user.hand.score || user.hand.score > 21)
      output_win(dealer)
      user.give_bet
      dealer.get_bet
    end

    if user.hand.score <= 21 && (user.hand.score > dealer.hand.score || dealer.hand.score > 21)
      output_win(user)
      user.get_bet
      dealer.give_bet
    end
  end

  def logic_take_card
    user.hand.take_card!(deck)
    show_user_info(user)
    show_cards(user)
  end
end
