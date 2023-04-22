require_relative 'deck'
require_relative 'game'
require_relative 'card'
class Score
    def initialize
        @p_score = 0
        @d_score = 0
    end
    def total(player_score)
        puts player_score[0]
    end
end