# Gameクラス
require_relative 'deck'
require_relative 'player'

class Game
    def initialize
        @deck = Deck.new
        @player = Player.new('あなた')
        @dealer = Player.new('ディーラー')
        @player_score = 0
        @dealer_score = 0
    end

    def play
        puts "ブラックジャックを開始します"
        @player_score = @player.draw(@deck,2)
        puts  @player_score

        puts "#{@player.name}の引いたカードは#{@player.cards[0].to_s}です。"
        puts "#{@player.name}の引いたカードは#{@player.cards[1].to_s}です。"

        @dealer.draw(@deck,2)
        puts "#{@dealer.name}の引いたカードは#{@dealer.cards[0].to_s}です"
        puts "ディーラーの引いた2枚目のカードはわかりません"

        puts "#{@player.name}の現在の得点は#{@player.cards[0].to_s}です。カードを引きますか？"

    end
end

# Game：ゲームの進行を管理するクラス
# Deck：山札を管理するクラス
# Player：プレイヤーを管理するクラス

# トップダウンとボトムアップを組み合わせる