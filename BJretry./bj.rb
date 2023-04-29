require_relative "deck"
require_relative "user"
require_relative "score"

class BlackJack

    def initialize
        @deck = Deck.new
        @player = User.new(@deck, "player" ,Score.new)
        @dealer = User.new(@deck, "dealer" ,Score.new)
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
        while @player.score < 22
            begin
                puts "カードを引きますか？引く場合はyを、引かない場合はnを入力してください"
                answer = gets.chomp
            rescue
                raise
                retry
            end
            case answer
                when "y"
                    @player.player_turn
                when "n"
                    puts "あなたのターンは終了です。次はディーラーのターンです"
                    break
            end
        end

        if @player.score > 21
            puts @dealer.current_score
            puts "ディーラーの勝ちです"
            return
        end

        # dealerの2回目のターンを実行するメソッドを呼び出す
        while @dealer.score <= 16
            @dealer.dealer_turn
        end

        # 結果発表
        if @dealer.score > 21
            puts "あなたの勝ちです"
            return
        end
        if @player.score == @dealer.score
            puts "引き分けです"
            return
        end
        if @player.score > @dealer.score

            puts "あなたの勝ちです"
        else
            puts "ディーラーの勝ちです"
        end


        # ⑦yが入力された場合、playerにカードを1枚引かせる
        # nの場合は、breakでループを抜ける
    end
end
start = BlackJack.new
start.play
