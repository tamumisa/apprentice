# Deckクラス(cardをシャッフルし、配るクラス)の作成

# [機能] シャッフル → カードを配布する 変数は[cards]
# [2-9] [10,J,Q,K]10点 [A]1or11 マーク s,h,c,d

require_relative 'card'
require_relative 'game'

class Deck
    def initialize
    # カードを配る関数
    # s,h,c,d と 1~14の数字を配列に格納する
        @cards = []
        Card::SUITS.each do |suit|
            Card::NUMBERS.each do |number|
                @cards << Card.new(suit,number)
            end
        end
        # シャッフルする関数
        @cards.shuffle!
    end
# カードをシャッフルし、カードを抜き出す（抜き出したカードは消えるようにする）変数はshuffle_card
    def draw(number)
        @cards.pop(number)
    end
end







