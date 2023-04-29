require_relative "deck"

class User
    attr_accessor :score

    def initialize(deck, role)
        @hand = []
        @score = 0
        @role = role
        @cards = deck.cards
    end

    def draw_card
        @cards.shift
    end
    # 引いたカードを表示するメソッドを作成する
    def present_a_card(drawed_card)
        puts "#{@role}の引いたカードは#{drawed_card[:suit]}です"
    end

    def first_player_turn
        puts "あなたのターンです"
        puts "カードを2枚引きます"
        # ①draw_cardメソッドの処理を2回繰り返し、2枚のカードを引いた結果を表示する
        2.times do
            drawed_card = draw_card
            present_a_card(drawed_card)
            calc_score(drawed_card)
        end
    end

    def first_dealer_turn
        puts "ディーラーのターンです"
        present_a_card(draw_card)
        draw_card
        puts "ディーラーの2枚目のカードは分かりません"
    end

    # ③スコアを計算するメソッドを作成する
    def calc_score(drawed_card)
        @score += drawed_card[:score]
    end

    def current_score
        puts "#{@role}の現在のスコアは#{@score}です"
    end

end