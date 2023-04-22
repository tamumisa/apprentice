class Player
    def initialize(name)
        @name = name
        @cards = []
    end

    def draw(deck, number)
        # deckからnumber枚のカードを引く=単一責務の法則
        @cards << deck.draw(number)
    end
end