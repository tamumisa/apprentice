# ユーザーを作成・権限付与・削除できる

Root権限を持つユーザーで MySQL へ接続してください。

## 1. ユーザーの作成

MySQL のユーザーを作成してください。名前とパスワードは任意、ホストは localhost を指定してください。
-
- MySQLのユーザ一覧を確認。
```
mysql> SELECT  host, user FROM mysql.user;
+-----------+------------------+
| host      | user             |
+-----------+------------------+
| localhost | mysql.infoschema |
| localhost | mysql.session    |
| localhost | mysql.sys        |
| localhost | root             |
+-----------+------------------+
4 rows in set (0.01 sec)
```

- ユーザーを作成
`CREATE USER 'test'@'localhost' IDENTIFIED BY 'test';`
→怒られたので`Your password does not satisfy the current policy requirements`
```
mysql> SHOW VARIABLES LIKE 'validate_password%';
+--------------------------------------+-------+
| Variable_name                        | Value |
+--------------------------------------+-------+
| validate_password_check_user_name    | ON    |
| validate_password_dictionary_file    |       |
| validate_password_length             | 8     |
| validate_password_mixed_case_count   | 1     | 英字の文字数
| validate_password_number_count       | 1     | 数字の文字数
| validate_password_policy             | LOW   | パスワードポリシー
| validate_password_special_char_count | 1     | 特殊文字の文字数
+--------------------------------------+-------+
7 rows in set (0.03 sec)
```
- LOW:validate_password_lengthで設定した値以上の文字数。
(長さ)
- MEDIUM:validate_password_lengthで設定した値以上の文字数。数字、大文字小文字、特殊文字が含まれている。
(長さ、大文字・小文字、記号)
- STRONG:validate_password_lengthで設定した値以上の文字数。
数字、大文字小文字、特殊文字が含まれている。
辞書ファイルを使用する場合辞書ファイルの単語と一致する文字列を含まない。
(長さ、大文字・小文字、記号、辞書)

## 2. ユーザーの表示

ユーザーを作成できたことを確認するために、ユーザーの一覧を表示してください。
```
mysql> CREATE USER 'tamumisa'@'localhost' IDENTIFIED BY 'tamutamu';
Query OK, 0 rows affected (0.00 sec)

mysql> SELECT  host, user FROM mysql.user;
+-----------+------------------+
| host      | user             |
+-----------+------------------+
| localhost | mysql.infoschema |
| localhost | mysql.session    |
| localhost | mysql.sys        |
| localhost | root             |
| localhost | tamumisa         |
+-----------+------------------+
5 rows in set (0.00 sec)
```


## 3. ユーザーへの権限付与

作成したユーザーに、MySQL 内のすべてのデータベースとテーブルへの root のフルアクセス権を付与してください。

なお、ユーザーへの権限付与を学習するために本問題を用意していますが、現場ですべてのデータベースへの root のフルアクセス権限を付与することはほぼありません。データベースのセキュリティを危険にさらす可能性があるためです。

## 4. 権限のリロード

ユーザーに権限を付与したら、すべての権限をリロードしてください。これにより設定が有効になります。

## 5. ユーザーの削除

作成したユーザーを削除してください。削除後、削除できていることを確認してください。

## 6. ユーザーの再作成

再度ユーザーを作成、権限付与、権限のリロードを行ってください。

今後は root ユーザーは基本的に使用せず、今回作成したユーザーを使用してください。