# 100回 "こんにちは！" と出力する関数 hello を定義してください。

# def hello()
#     100.times{
#         puts("こんにちは")
#     }
# end

# hello()

# 羊が1匹 羊が2匹 羊が3匹 ...と、n 回羊の数えを出力する関数 sheep を定義してください。

# def sheep(n)
#     for num in 1..n do
#         puts "羊が#{num}匹"
#     end
# end
# sheep(3)

# 1 から 100 までの足し算の結果を出力する関数 sum_1_100 を定義してください。

# def sum_1_100()
#     result = 0
#     for i in 1..100
#         result += i
#     end
#     puts result
# end

# sum_1_100()

# 2つの整数 x と y が与えられ、x から y までの足し算の結果を出力する関数 sum を定義してください。

def sum(x, y)
    result = 0
    for i in x..y
        result += i
    end
    puts result
end

sum(10, 80)