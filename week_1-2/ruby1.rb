# #デフォルト引数
# def a(a,b,c = 0, d = 0)
#     puts "a=#{a}, b=#{b}, c=#{c}, d=#{d}"
# end
# a(1,2)

# システム日時やほかのメソッドの戻り地をデフォルト値にする

# def foo(time = Time.now,message = bar)
#     puts "time:#{time},message:#{message}"
# end
# def bar
#     "BAR"
# end

# >> time:2023-04-25 09:02:56 +0900,message:BAR

# 空文字であればtureを返す、そうでなければfalse
# puts ''.empty?
# puts   'abc'.empty?

# #引数の文字列が含まれていればtrueを返す
# puts 'watch'.include?('at')
# puts 'watch'.include?('in')

#奇数ならtrue、偶数ならfalse
# puts 1.odd?
# puts 2.odd?
# puts 1.even?
# puts 2.even?
#オブジェクトがnilであればtrue、そうでなければfalse
# puts nil.nil?
# puts 'abc'.nil?
# puts 1.nil?

# ?で終わるメソッドは慣習として真偽値を返すメソッド
# 3の倍数ならtrue,それ以外はfalse

# def multipie_of_three?(n)
#     n % 3 == 0
# end
# multipie_of_three?(4)
# multipie_of_three?(5)
# multipie_of_three?(6)

# !で終わるメソッドは慣習として「使用する際は注意が必要」という意味を持つ
# !で終わるメソッドよりも危険という意味を持ちます。Stringクラスにはupcaseとupcaesメソッドという2つのメソッドがあります。
# どちらも文字列を大文字にするメソッドですが、upcase!メソッドは元の文字列を大文字に変更してしまいます。

# a = 'ruby'
# a.upcase!
# puts a
# a.upcase
# puts a

# def reverse_upcase(s)
#     s.reverse.upcase
# end
# def reverse_upcase!(s)
#     s.reverse!
#     s.upcase!
#     puts s
# end

# s = 'ruby'
# reverse_upcase(s)
# puts s
# reverse_upcase!(s)
# puts s

# エンドレスメソッド

# 通常メソッドの定義

def greet
    'hello'
end

# エンドレスメソッド定義(=に続けて処理や戻り値を書く)


# def square(x) = x * x

# puts greet
# puts square(2)

# rubyのいろいろ
# エイリアスメソッド→処理が全く同じメソッドに違う名前がついている 例：lengthとsize
# rubyのif文やメソッド定義は文ではなく、指揮になっている。if文やメソッド定義が値を返す
# if文が値を返すので変数に代入できる
a =
    if true
        '真です'
    else
        '偽です'
    end
puts a
puts a.object_id

a = 1
puts a.object_id

# if文はif式　メソッド定義式　とよんだほうが実態に即している。
# 式＝値を返し、結果を変数に代入できるものを式
# 文＝値を返さず、変数に代入しようとすると構文エラーになるものが文

# 疑似変数 変数と同じように値を読み出すことができるが、代入しようとするとエラーが発生する
# nil true false self __FILE__ __LINE__ __ENCODING__

# 標準ライブラリやgemを読み込むときは、require
# 独人のクラス定義など読み込む場合は、require_relative 相対パスも必要!!

# putsメソッドとprintメソッドは引数で渡されたオブジェクトに対し、to_sメソッドを呼び出して文字列に変換
# p は「inspectメソッドを呼び出す」開発者向け！！！　ppはpを見やすく整形してくれる
# putsやpはKernelモジュールに定義されているメソッド

a = 'abc'.inspect
p a
# "\"abc\""
