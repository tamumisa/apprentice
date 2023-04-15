# オブジェクト指向を使うことができる

# 自動販売機のプログラムを書くクエストです。

# - 自動販売機のクラス VendingMachine を宣言してください
# - ボタンを押すとサイダーが出るようにします。press_button メソッドを実行すると 'cider' の文字列を返してください

class VendingMachine
    def press_button()
        return puts "cider"
    end
end

vending_machine = VendingMachine.new
puts vending_machine.press_button