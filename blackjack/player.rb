class Player
    attr_reader :name, :cards
    def initialize(name)
        @name = name
        @cards = []
    end

    def draw(card , number)
        # deckからnumber枚のカードを引く=単一責務の法則
        puts card
        @cards += draw(number)
    end
end