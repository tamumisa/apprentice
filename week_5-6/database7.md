# データを集計できる

## 1. 列の合計値

給与情報(salaries テーブル)から、全データの給与の合計値を求めてください。

まず、salariesテーブルの中身の確認

```sql
mysql> show columns from salaries;
+-----------+------+------+-----+---------+-------+
| Field     | Type | Null | Key | Default | Extra |
+-----------+------+------+-----+---------+-------+
| emp_no    | int  | NO   | PRI | NULL    |       |
| salary    | int  | NO   |     | NULL    |       |
| from_date | date | NO   | PRI | NULL    |       |
| to_date   | date | NO   |     | NULL    |       |
+-----------+------+------+-----+---------+-------+
4 rows in set (0.01 sec)
```

```sql
mysql> select SUM(salary) from salaries;
+--------------+
| SUM(salary)  |
+--------------+
| 181480757419 |
+--------------+
1 row in set (0.67 sec)
```

## 2. 列の平均値

給与情報から、全データの給与の平均値を求めてください。

```sql
mysql> select avg(salary) from salaries;
+-------------+
| avg(salary) |
+-------------+
|  63810.7448 |
+-------------+
1 row in set (0.62 sec)
```

## 3. 四捨五入

給与の平均値は小数点で取得されたかと思います。給与の平均値を四捨五入して整数で求めてください。

```sql
mysql> select ROUND(avg(salary)) from salaries;
+--------------------+
| ROUND(avg(salary)) |
+--------------------+
|              63811 |
+--------------------+
1 row in set (0.52 sec)
```

## 3. 列の最大値

給与情報から、全データの給与の最大値を求めてください。

```sql
mysql> select max(salary) from salaries;
+-------------+
| max(salary) |
+-------------+
|      158220 |
+-------------+
1 row in set (0.48 sec)
```

```sql
mysql> select *  from salaries where salary = (select max(salary) from salaries);
+--------+--------+------------+------------+
| emp_no | salary | from_date  | to_date    |
+--------+--------+------------+------------+
|  43624 | 158220 | 2002-03-22 | 9999-01-01 |
+--------+--------+------------+------------+
1 row in set (1.06 sec)
```

## 4. 列の最小値

給与情報から、全データの給与の最小値を求めてください。

```sql
mysql> select *  from salaries where salary = (select min(salary) from salaries);
+--------+--------+------------+------------+
| emp_no | salary | from_date  | to_date    |
+--------+--------+------------+------------+
| 253406 |  38623 | 2002-02-20 | 9999-01-01 |
+--------+--------+------------+------------+
1 row in set (1.05 sec)
```


## 5. 行数

給与情報から、全データの行数を求めてください。

mysql> select count(*) from salaries;
+----------+
| count(*) |
+----------+
|  2844047 |
+----------+
1 row in set (0.06 sec)

## 6. 絞り込みとの組み合わせ

from_date が1986年6月26日の従業員の最大給与を取得してください。

```sql
mysql> select * from salaries where from_date = '1986-06-26' order by salary desc LIMIT 1;
+--------+--------+------------+------------+
| emp_no | salary | from_date  | to_date    |
+--------+--------+------------+------------+
| 259837 | 103344 | 1986-06-26 | 1987-06-26 |
+--------+--------+------------+------------+
1 row in set (0.56 sec)
```

## 7. 少数第1桁

to_date が1991年6月26日の従業員の平均給与を少数第1桁で取得してください。

```sql
mysql> select round(avg(salary),1) from salaries where to_date = '1991-06-26';
+----------------------+
| round(avg(salary),1) |
+----------------------+
|              57371.6 |
+----------------------+
1 row in set (0.49 sec)
```
SQL文でROUND関数とAVG関数が混ざった例文
例文
```sql
SELECT ROUND(AVG(salary), 2) AS average_salary
FROM employees;
```