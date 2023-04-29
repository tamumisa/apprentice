require_relative "bj"
require_relative "user"

class Deck
    attr_accessor :cards
    def initialize
        @cards
    end

    def create_card
        @cards = [
            {suit:'♠A',score:0},
            {suit:'♠2',score:2},
            {suit:'♠3',score:3},
            {suit:'♠4',score:4},
            {suit:'♠5',score:5},
            {suit:'♠6',score:6},
            {suit:'♠7',score:7},
            {suit:'♠8',score:8},
            {suit:'♠9',score:9},
            {suit:'♠10',score:10},
            {suit:'♠J',score:10},
            {suit:'♠Q',score:10},
            {suit:'♠K',score:10},
            {suit:'♣A',score:0},
            {suit:'♣2',score:2},
            {suit:'♣3',score:3},
            {suit:'♣4',score:4},
            {suit:'♣5',score:5},
            {suit:'♣6',score:6},
            {suit:'♣7',score:7},
            {suit:'♣8',score:8},
            {suit:'♣9',score:9},
            {suit:'♣10',score:10},
            {suit:'♣J',score:10},
            {suit:'♣Q',score:10},
            {suit:'♣K',score:10},
            {suit:'♦A',score:0},
            {suit:'♦2',score:2},
            {suit:'♦3',score:3},
            {suit:'♦4',score:4},
            {suit:'♦5',score:5},
            {suit:'♦6',score:6},
            {suit:'♦7',score:7},
            {suit:'♦8',score:8},
            {suit:'♦9',score:9},
            {suit:'♦10',score:10},
            {suit:'♦J',score:10},
            {suit:'♦Q',score:10},
            {suit:'♦K',score:10},
            {suit:'♥A',score:0},
            {suit:'♥2',score:2},
            {suit:'♥3',score:3},
            {suit:'♥4',score:4},
            {suit:'♥5',score:5},
            {suit:'♥6',score:6},
            {suit:'♥7',score:7},
            {suit:'♥8',score:8},
            {suit:'♥9',score:9},
            {suit:'♥10',score:10},
            {suit:'♥J',score:10},
            {suit:'♥Q',score:10},
            {suit:'♥K',score:10}
        ]
    end
    def shuffle
        @cards.shuffle!
        print @cards.length
    end
    def take_out_card
        @cards.first
        puts @cards.first
    end

    def remove(card)
        puts card
        @cards.delete(card)
    end
end

