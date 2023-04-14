# 2つの整数 x, y の大小を比較し、xとyの大小関係を出力する関数 greater を定義してください。

# x,yを引数に受け取るgreater関数を作成
# def greater(x,y)
#     if x > y
#         puts ("x > y")
#     elsif x < y
#         puts ("x < y")
#     elsif x == y
#         puts ("x == y")
#     end
# end
# greater(5 ,4 )
# greater(-50 ,-40)
# greater(10 ,10)

# 電車の料金
# 東京駅から新宿駅までJR山手線に乗って移動します。
# 12歳以上は大人料金で200円、6歳以上12歳未満はこども料金で100円、6歳未満は幼児で無料となります。
# 年齢に応じて東京駅から新宿駅までの料金を出力する関数 train_fare を定義してください。

# def train_fare(x)
#     if x >= 12
#         puts "200円です"
#     elsif x >= 6
#         puts "100円"
#     elsif x < 6
#         puts "無料です"
#     end
# end

# train_fare(12)
# train_fare(6)
# train_fare(5)

# 2つのブーリアン値 x と y が与えられ、x と y のうちどちらかが真なら true を出力し、
# 両方真もしくは両方偽なら false を出力する関数 xor を定義してください。

def xor(x,y)
    if x == y
        puts false
    elsif x != y
        puts true
    end
end

xor(true, true)
xor(true, false)
xor(false, true)
xor(false, false)