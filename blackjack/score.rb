require_relative 'deck'
require_relative 'game'
class Score
    def initialize
        @p_score = 0
        @d_score = 0
    end
    def total(player_score)
        puts player_score
    end
end