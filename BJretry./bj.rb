require_relative "deck"
require_relative "user"

class BlackJack
    attr_accessor :deck , :player

    def initialize
        @deck = Deck.new
        @player = User.new
    end

    def play
        puts "Welcome to BlackJack!"
        puts "Game Start!"
        deck.create_card
        @deck.shuffle
        @player.first_plyer_turn(deck)
        # puts deck.cards[0][:suit]
    end
end
start = BlackJack.new
start.play
