require_relative "deck"

class BlackJack
    def play
        deck = Deck.new

        puts "Welcome to BlackJack!"
        puts "Game Start!"
        deck.create_card
        deck.shuffle
        deck.take_out_card
        puts deck.cards[0][:suit]
        deck.remove(deck.cards[0])
        puts deck.cards.length
    end
end
start = BlackJack.new
start.play
