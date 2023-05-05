# ユーザーを作成・権限付与・削除できる

> Root権限を持つユーザーで MySQL へ接続してください。

## 1. ユーザーの作成

> MySQL のユーザーを作成してください。名前とパスワードは任意、ホストは localhost を指定してください。

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
- 怒られたの`Your password does not satisfy the current policy requirements`

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



```
mysql> SHOW VARIABLES LIKE 'validate_password%';
+--------------------------------------+-------+
| Variable_name                        | Value |
+--------------------------------------+-------+
| validate_password_check_user_name    | ON    |
| validate_password_dictionary_file    |       |
| validate_password_length             | 8     |
| validate_password_mixed_case_count   | 0     |
| validate_password_number_count       | 0     |
| validate_password_policy             | LOW   |
| validate_password_special_char_count | 0     |
+--------------------------------------+-------+
7 rows in set (0.01 sec)
```
**memo**
`CREATE USER 'ユーザー名'@'ホスト名' IDENTIFIED BY 'パスワード';`

## 2. ユーザーの表示

> ユーザーを作成できたことを確認するために、ユーザーの一覧を表示してください。

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

> 作成したユーザーに、MySQL 内のすべてのデータベースとテーブルへの root のフルアクセス権を付与してください。

> なお、ユーザーへの権限付与を学習するために本問題を用意していますが、現場ですべてのデータベースへの root のフルアクセス権限を付与することはほぼありません。データベースのセキュリティを危険にさらす可能性があるためです。

- 現在の権限を確認
```
mysql> show grants for tamumisa@localhost;
+----------------------------------------------+
| Grants for tamumisa@localhost                |
+----------------------------------------------+
| GRANT USAGE ON *.* TO `tamumisa`@`localhost` |
+----------------------------------------------+
1 row in set (0.00 sec)
```
- グローバルレベルで USAGE という権限が設定されている
- USAGE という権限は「何も権限がない」という権限😨
- **つまり新しく作成したユーザーは、すべてのデータベースを対象に何も権限がない状態となっています。**

[MySQLユーザ作成について](https://qiita.com/gatapon/items/92b942fa7081cfe17482)

- 全データベースへのアクセス権を設定する
```
mysql> grant create on *.* to tamumisa@localhost;
Query OK, 0 rows affected (0.00 sec)
```
```
mysql> show grants for tamumisa@localhost;
+-----------------------------------------------+
| Grants for tamumisa@localhost                 |
+-----------------------------------------------+
| GRANT CREATE ON *.* TO `tamumisa`@`localhost` |
+-----------------------------------------------+
1 row in set (0.00 sec)
```
[MySQL でユーザに設定するパスワードのセキュリティレベルを下げる](https://yshystsj.com/2019/01/10/post-35/)
[ユーザーに権限を設定する(GRANT文)](https://www.javadrive.jp/mysql/user/index6.html#section2)
[GRANT ステートメント](https://dev.mysql.com/doc/refman/8.0/ja/grant.html#grant-overview)
[ポリシーを変更](https://kiraba.jp/change-mysql57-password-policy/)
[ポリシーを変更](https://qiita.com/keisukeYamagishi/items/d897e5c52fe9fd8d9273)

## 4. 権限のリロード

[使用可能な権限のサマリー](https://dev.mysql.com/doc/refman/8.0/ja/privileges-provided.html)
[MySQLでユーザを作成し、権限を設定する方法](https://proengineer.internous.co.jp/content/columnfeature/6638)
ユーザーに権限を付与したら、すべての権限をリロードしてください。これにより設定が有効になります。
```
FLUSH PRIVILEGES;
```

## 5. ユーザーの削除

> 作成したユーザーを削除してください。削除後、削除できていることを確認してください。
```
DROP USER 'tamumisa'@'localhost';
```

## 6. ユーザーの再作成

> 再度ユーザーを作成、権限付与、権限のリロードを行ってください。
> 今後は root ユーザーは基本的に使用せず、今回作成したユーザーを使用してください。

```
mysql> CREATE USER 'tamumisa'@'localhost' IDENTIFIED BY 'tamutamu';
Query OK, 0 rows affected (0.00 sec)

mysql> show grants for tamumisa@localhost;
+----------------------------------------------+
| Grants for tamumisa@localhost                |
+----------------------------------------------+
| GRANT USAGE ON *.* TO `tamumisa`@`localhost` |
+----------------------------------------------+
1 row in set (0.00 sec)

mysql> grant create on *.* to tamumisa@localhost;
Query OK, 0 rows affected (0.00 sec)

mysql> show grants for tamumisa@localhost;
+-----------------------------------------------+
| Grants for tamumisa@localhost                 |
+-----------------------------------------------+
| GRANT CREATE ON *.* TO `tamumisa`@`localhost` |
+-----------------------------------------------+
1 row in set (0.00 sec)

mysql> FLUSH PRIVILEGES;
Query OK, 0 rows affected (0.00 sec)
```