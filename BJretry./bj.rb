require_relative "deck"
require_relative "user"

class BlackJack

    def initialize
        @deck = Deck.new
        @player = User.new(@deck, "player")
        @dealer = User.new(@deck, "dealer")
    end

    def play
        puts "Welcome to BlackJack!"
        puts "Game Start!"
        # playerの1回目のターンを実行するメソッドを呼び出す
        @player.first_player_turn
        # dealerの1回目のターンを実行するメソッドを呼び出す
        @dealer.first_dealer_turn
        @player.current_score

        # playerの2回目のターンを実行するメソッドを呼び出す
        # y or nを入力させる
        # while @player.score < 22
        #     begin
        #         puts "カードを引きますか？引く場合はyを、引かない場合はnを入力してください"
        #         answer = gets.chomp
        #     rescue
        #         raise
        #         retry
        #     end
        # end


        # ⑦yが入力された場合、playerにカードを1枚引かせる
        # nの場合は、breakでループを抜ける
    end
end
start = BlackJack.new
start.play
