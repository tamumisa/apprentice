# テーブルを作成・修正・削除できる

> 作成済みのデータベースを指定して MySQL に接続してください。MySQL に接続後、使用するデータベースを指定しても大丈夫です。


## 1. テーブルの作成

> 任意のテーブルを作成してください。テーブルのカラムは自由に作成してください。

```
 create table house(id int,table varchar(3));
```

## 2. テーブルの表示

> テーブルが作成できたことを確認するために、テーブルの一覧を表示してください。
```
mysql> show tables;
+--------------------+
| Tables_in_tamutamu |
+--------------------+
| house              |
+--------------------+
1 row in set (0.00 sec)
```
## 3. カラムの追加

> 作成したテーブルに、任意のカラムを一列追加してください。

```
alter table house add (chair varchar(3));
```

## 4. カラムの表示

> カラムが追加できたことを確認するために、テーブルのカラムの一覧を表示してください。

```
mysql> desk house;
ERROR 1064 (42000): You have an error in your SQL syntax; check the manual that corresponds to your MySQL server version for the right syntax to use near 'desk house' at line 1
mysql> DESC house;
+-------+------------+------+-----+---------+-------+
| Field | Type       | Null | Key | Default | Extra |
+-------+------------+------+-----+---------+-------+
| id    | int        | YES  |     | NULL    |       |
| name  | varchar(3) | YES  |     | NULL    |       |
| chair | varchar(3) | YES  |     | NULL    |       |
+-------+------------+------+-----+---------+-------+
3 rows in set (0.01 sec)
```

## 5. カラムの削除

> 追加したカラムを削除してください。削除後、削除できていることを確認してください。

```
mysql> alter table house drop name;
Query OK, 0 rows affected (0.01 sec)
Records: 0  Duplicates: 0  Warnings: 0
```
```
mysql> desc house;
+-------+------------+------+-----+---------+-------+
| Field | Type       | Null | Key | Default | Extra |
+-------+------------+------+-----+---------+-------+
| id    | int        | YES  |     | NULL    |       |
| chair | varchar(3) | YES  |     | NULL    |       |
+-------+------------+------+-----+---------+-------+
2 rows in set (0.01 sec)
```

## 6. テーブルの削除

> 作成したテーブルを削除してください。削除後、削除できていることを確認してください。

```
mysql> drop table house;
Query OK, 0 rows affected (0.01 sec)
```
```
mysql> show tables;
Empty set (0.00 sec)
```

## 7. テーブルの再作成

> 再度テーブルを作成しましょう。

> 今後、作成したテーブルを指定して作業します。

```
mysql> create table house_hold_accountbook(id int,title varchar(10),input_time text);
Query OK, 0 rows affected (0.01 sec)
```