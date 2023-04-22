# Gameクラス
class Game

    def initialize
        @deck = Deck.new
        @Player = Player.new
    end
    def puts "ブラックジャックを開始します"
        @player.draw(@deck)
        puts "あなたの引いたカードは#{@player.cards[0].to_s}です。"
    end
end

# Game：ゲームの進行を管理するクラス
# Deck：山札を管理するクラス
# Player：プレイヤーを管理するクラス