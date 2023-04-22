class Player
    attr_reader :name, :cards
    def initialize(name)
        @name = name
        @cards = []
    end

    def draw(deck, number)
        # deckからnumber枚のカードを引く=単一責務の法則
        @cards << deck.draw(number)
        @cards.flatten!
    end
end