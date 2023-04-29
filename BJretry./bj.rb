require_relative "deck"
require_relative "user"

class BlackJack

    def initialize
        @deck = Deck.new
        @player = User.new
    end

    def play
        puts "Welcome to BlackJack!"
        puts "Game Start!"
        puts @deck.cards.length
        @player.first_plyer_turn(@deck.cards)
        # puts deck.cards[0][:suit]

        # ②playerの1回目のスコアを計算するメソッドを呼び出す
        # player.calc_score

        # ④dealerの1回目のターンを実行するメソッドを呼び出す

        # ⑤dealerの1回目のスコアを計算するメソッドを呼び出す

        # ⑥playerの2回目のターンを実行するメソッドを呼び出す
        # まずは、playerにカードを1枚引かせる
        # y or nを入力させる

        # ⑦yが入力された場合、playerにカードを1枚引かせる
        # nの場合は、breakでループを抜ける
    end
end
start = BlackJack.new
start.play
