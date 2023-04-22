# Gameクラス
require_relative 'deck'
require_relative 'player'

class Game
    def initialize
        @deck = Deck.new
        @Player = Player.new('あなた')
    end

    def play
        puts "ブラックジャックを開始します"
        @player.draw(@deck,2)
        puts "あなたの引いたカードは#{@player.cards[0].to_s}です。"
        puts "あなたの引いたカードは#{@player.cards[1].to_s}です。"

    end
end

# Game：ゲームの進行を管理するクラス
# Deck：山札を管理するクラス
# Player：プレイヤーを管理するクラス

# トップダウンとボトムアップを組み合わせる