require_relative "deck"

class User
    attr_accessor :cards , :score, :role

    def initialize
        @hand = []
        @score = 0
        @role = "あなた"
    end

    def draw_card(deck)
        user_card = deck.take_out_card
        @hand << user_card
        deck.remove
    end
    # 引いたカードを表示するメソッドを作成する
    def present_a_card(deck)
        puts "#{role}の引いたカードは#{deck.cards[0][:suit]}です"
    end

    def first_plyer_turn(deck)
        puts "あなたのターンです"
        puts "カードを2枚引きます"
        # ①draw_cardメソッドの処理を2回繰り返し、2枚のカードを引いた結果を表示する
        2.times do
            draw_card(deck)
            present_a_card(deck)
        end
    end

    # ③スコアを計算するメソッドを作成する
    def calc_score
        @score = @hand.sum{|card| card[:score]}
        puts score
    end


    # スコアを表示するメソッドを作成する
end
