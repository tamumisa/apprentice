# require 'minitest/autorun'

# class SampleTest < Minitest::Test
#     def test_sample
#         # assert_equal 期待する結果,テスト対象となる値や式
#         assert_equal A, a
#     end
# end

def fizz_buzz(n)
    if n % 15 == 0
        "FizzBuzz"
    elsif n % 3 == 0
        "Fizz"
    elsif n % 5 == 0
        "Buzz"
    else
        n.to_s
    end
end

require 'minitest/autorun'

class FizzBuzzTest < Minitest::Test
    def test_fizz_buzz
        assert_equal '1',fizz_buzz(1)
        assert_equal '2',fizz_buzz(2)
        assert_equal 'Fizz',fizz_buzz(3)
    end
end
