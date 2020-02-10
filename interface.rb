# frozen_string_literal: true

module Interface
  def show_main_info(user, dealer)
    show_user_info(user)
    show_cards(user)
    puts 'Dealer очки: **'
    show_shadow_cards(dealer)
  end

  def show_user_info(user)
    puts "#{user.name} очки: #{user.hand.score}"
  end

  def show_cards(obj)
    obj.hand.card_collection.each { |card| puts "(#{card.face}-#{card.suit})" }
  end

  def show_shadow_cards(obj)
    obj.hand.card_collection.each { |_card| puts '(**-**)' }
  end

  def set_name(user)
    puts 'Введите ваше имя'
    user.name = gets.chomp.to_s.capitalize!
  end

  def show_name_cash_info(user, dealer)
    puts "#{user.name} очки: #{user.hand.score}"
    puts "#{dealer.name} очки: #{dealer.hand.score}"
    puts "#{user.name} $: #{user.cash}"
    puts "#{dealer.name} $: #{dealer.cash}"
    puts '________________________________'
  end

  def output_win(player)
    puts "#{player.name} WIN!"
  end

  def output_loser(player)
    puts "#{player.name} LOST!"
  end

  def output_draw(user, dealer)
    puts "Draw\n #{user.name}:#{user.hand.score} = dealer:#{dealer.hand.score}"
  end

  def show_user_actions
    print "1 - Взять карту\n2 - Пропустить ход\n"
  end
end
