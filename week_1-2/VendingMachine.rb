## 1. クラスの定義

# オブジェクト指向を使うことができる

# 自動販売機のプログラムを書くクエストです。

# - 自動販売機のクラス VendingMachine を宣言してください
# - ボタンを押すとサイダーが出るようにします。press_button メソッドを実行すると 'cider' の文字列を返してください

# class VendingMachine
#     def press_button()
#         return puts "cider"
#     end
# end

# vending_machine = VendingMachine.new
# puts vending_machine.press_button

## 2. initializeメソッド

# 自動販売機のプログラムに initialize メソッド を追加しましょう。下記の仕様を追加します。

# - オブジェクトの生成時に自動販売機のメーカー名を記録できるように、initialize メソッドを追加します
# - 自動販売機のメーカー名確認ボタンを押すと、メーカー名を返す press_manufacturer_name メソッドを追加する


class VendingMachine
    def initialize(name)
        # インスタンス作成時に渡された名前をインスタンス変数に保存する
        @name = name
    end

    def press_manufacturer_name()
        # インスタンス変数に保存されている名前を表示する
        puts @name

    end
end

vending_machine = VendingMachine.new('サントリー')
puts vending_machine.press_manufacturer_name