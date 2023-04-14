# 2つの整数 x, y の大小を比較し、xとyの大小関係を出力する関数 greater を定義してください。

# x,yを引数に受け取るgreater関数を作成
def greater(x,y)
    if x > y
        puts ("x > y")
    elsif x < y
        puts ("x < y")
    elsif x == y
        puts ("x == y")
    end
end
greater(5 ,4 )
greater(-50 ,-40)
greater(10 ,10)

