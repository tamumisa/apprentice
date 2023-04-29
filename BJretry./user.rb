require_relative "deck"

class User
    attr_accessor :cards , :score, :role

    def initialize
        @hand = []
        @score = 0
    end

    def draw_card(deck)
        user_card = deck.take_out_card
        puts user_card
        # hand << user_card
        # deck.remove(user_card)
    end

    # def present_a_card
    #     puts "#{role}の引いたカードは#{hand[0][:suit]}です"
    # end

    def first_plyer_turn(deck)
        puts "あなたのターンです"
        puts "カードを2枚引きます"
        puts deck.cards[0][:suit]
        # 2.times do
        #     draw_card(deck)
        #     puts "#{role}の引いたカードは#{deck[0][:suit]}です"
        # end
    end
end
