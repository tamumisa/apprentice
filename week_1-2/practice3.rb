# 変数を宣言し代入することができる
# 1. 三角形の面積
# 底辺が x cm、高さが y cmの三角形の面積を出力する関数 area を定義してください。

puts "三角形の面積を求める関数です"
puts "底辺の長さを入力してください"
x = gets.to_i
puts "高さの長さを入力してください"
y = gets.to_i

def area(x,y)
    puts "面積は#{(x*y)/2}平方センチメートルです"
end
area(x,y)