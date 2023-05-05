# データを登録・検索・更新・削除できる

## 1. データの登録

作成済みのテーブルに対して、任意のデータを一行分追加してください。

```c
insert into house_hold_accountbook values(1,'焼き芋','0505');
```

## 2. データの検索

データを追加したテーブルに対して、すべてのデータを検索して出力してください。

```c
select * from house_hold_accountbook;
+------+-----------+------------+
| id   | title     | input_time |
+------+-----------+------------+
|    1 | 焼き芋    | 0505       |
+------+-----------+------------+
1 row in set (0.00 sec)
```

## 3. データの更新

追加済みのデータのある行の値を別の値に更新してください。

```c
mysql> update house_hold_accountbook set title ='黒糖' where id = 1;
Query OK, 1 row affected (0.01 sec)
Rows matched: 1  Changed: 1  Warnings: 0
```
```c
mysql> select * from house_hold_accountbook;
+------+--------+------------+
| id   | title  | input_time |
+------+--------+------------+
|    1 | 黒糖   | 0505       |
+------+--------+------------+
1 row in set (0.00 sec)
```


## 4. データの削除

テーブル内の全データを削除してください。

```c
mysql> delete from house_hold_accountbook;
Query OK, 1 row affected (0.00 sec)
```
```c
mysql> select * from house_hold_accountbook;
Empty set (0.00 sec)
```