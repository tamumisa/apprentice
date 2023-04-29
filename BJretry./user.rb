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
        puts user_card
        hand << user_card
        deck.remove(user_card)
    end

    # def present_a_card
    #     puts "#{role}の引いたカードは#{hand[0][:suit]}です"
    # end

    def first_plyer_turn(deck)
        puts "あなたのターンです"
        puts "カードを2枚引きます"
        # ①draw_cardメソッドの処理を2回繰り返し、2枚のカードを引いた結果を表示する
        puts deck.cards[0][:suit]
    end

    # 引いたカードを表示するメソッドを作成する
    def present_a_card(deck)
    puts "#{role}の引いたカードは#{deck.cards[0][:suit]}です"
    end

    # ③スコアを計算するメソッドを作成する

    # スコアを表示するメソッドを作成する
end
