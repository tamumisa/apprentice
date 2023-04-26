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
puts nil.nil?
puts 'abc'.nil?
puts 1.nil?

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

a = 'ruby'
a.upcase!
puts a
a.upcase
puts a
