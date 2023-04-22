# cardの集合体がdeck deckからcardを引くのはplayer playerはdeckからcardを引く
class Card
    SUITS = ["s","h","c","d"].freeze
    NUMBERS = ["A","2","3","4","5","6","7","8","9","10","J","Q","K"].freeze
    SUITS_JP = {
        "s" => "スペード",
        "h" => "ハート",
        "c" => "クラブ",
        "d" => "ダイヤ"
    }

    def initialize(suit , number)
        @suit = suit
        @number = number
    end

    def to_s
        "#{SUITS_JP[@suit]}の#{@number}"
    end
end