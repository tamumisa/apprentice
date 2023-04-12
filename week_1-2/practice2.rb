# メソッドを自作し使うことができる
# 1. Hello World
# "Hello World" と標準出力（画面）に出力する関数 hello を定義してください。

def hello
    puts "Hello World"
end
hello()

# 2. 挨拶
# 名前を引数に受け取り、
# 与えられた名前の挨拶メッセージを標準出力（画面）に出力する greeting という関数を書きなさい。

puts "名前を入力してください"
name = gets

def greeting(name)
    puts "おはよう#{name}！"
end
greeting(name)


