# テーブルを結合できる

テーブルの中身を確認
```sql
mysql> show tables;
+----------------------+
| Tables_in_employees  |
+----------------------+
| current_dept_emp     |
| departments          |
| dept_emp             |
| dept_emp_latest_date |
| dept_manager         |
| employees            |
| salaries             |
| titles               |
+----------------------+
8 rows in set (0.05 sec)
```

## 1. 内部結合

部署マネージャーテーブルに、従業員テーブルのデータを内部結合させた全データを取得してください。

```sql
mysql> select * from dept_manager inner join employees on dept_manager.emp_no = employees.emp_no;
+--------+---------+------------+------------+--------+------------+-------------+--------------+--------+------------+
| emp_no | dept_no | from_date  | to_date    | emp_no | birth_date | first_name  | last_name    | gender | hire_date  |
+--------+---------+------------+------------+--------+------------+-------------+--------------+--------+------------+
| 110022 | d001    | 1985-01-01 | 1991-10-01 | 110022 | 1956-09-12 | Margareta   | Markovitch   | M      | 1985-01-01 |
| 110039 | d001    | 1991-10-01 | 9999-01-01 | 110039 | 1963-06-21 | Vishwani    | Minakawa     | M      | 1986-04-12 |
| 110085 | d002    | 1985-01-01 | 1989-12-17 | 110085 | 1959-10-28 | Ebru        | Alpin        | M      | 1985-01-01 |
| 110114 | d002    | 1989-12-17 | 9999-01-01 | 110114 | 1957-03-28 | Isamu       | Legleitner   | F      | 1985-01-14 |
| 110183 | d003    | 1985-01-01 | 1992-03-21 | 110183 | 1953-06-24 | Shirish     | Ossenbruggen | F      | 1985-01-01 |
| 110228 | d003    | 1992-03-21 | 9999-01-01 | 110228 | 1958-12-02 | Karsten     | Sigstam      | F      | 1985-08-04 |
| 110303 | d004    | 1985-01-01 | 1988-09-09 | 110303 | 1956-06-08 | Krassimir   | Wegerle      | F      | 1985-01-01 |
| 110344 | d004    | 1988-09-09 | 1992-08-02 | 110344 | 1961-09-07 | Rosine      | Cools        | F      | 1985-11-22 |
| 110386 | d004    | 1992-08-02 | 1996-08-30 | 110386 | 1953-10-04 | Shem        | Kieras       | M      | 1988-10-14 |
| 110420 | d004    | 1996-08-30 | 9999-01-01 | 110420 | 1963-07-27 | Oscar       | Ghazalie     | M      | 1992-02-05 |
| 110511 | d005    | 1985-01-01 | 1992-04-25 | 110511 | 1957-07-08 | DeForest    | Hagimont     | M      | 1985-01-01 |
| 110567 | d005    | 1992-04-25 | 9999-01-01 | 110567 | 1964-04-25 | Leon        | DasSarma     | F      | 1986-10-21 |
| 110725 | d006    | 1985-01-01 | 1989-05-06 | 110725 | 1961-03-14 | Peternela   | Onuegbe      | F      | 1985-01-01 |
| 110765 | d006    | 1989-05-06 | 1991-09-12 | 110765 | 1954-05-22 | Rutger      | Hofmeyr      | F      | 1989-01-07 |
| 110800 | d006    | 1991-09-12 | 1994-06-28 | 110800 | 1963-02-07 | Sanjoy      | Quadeer      | F      | 1986-08-12 |
| 110854 | d006    | 1994-06-28 | 9999-01-01 | 110854 | 1960-08-19 | Dung        | Pesch        | M      | 1989-06-09 |
| 111035 | d007    | 1985-01-01 | 1991-03-07 | 111035 | 1962-02-24 | Przemyslawa | Kaelbling    | M      | 1985-01-01 |
| 111133 | d007    | 1991-03-07 | 9999-01-01 | 111133 | 1955-03-16 | Hauke       | Zhang        | M      | 1986-12-30 |
| 111400 | d008    | 1985-01-01 | 1991-04-08 | 111400 | 1959-11-09 | Arie        | Staelin      | M      | 1985-01-01 |
| 111534 | d008    | 1991-04-08 | 9999-01-01 | 111534 | 1952-06-27 | Hilary      | Kambil       | F      | 1988-01-31 |
| 111692 | d009    | 1985-01-01 | 1988-10-17 | 111692 | 1954-10-05 | Tonny       | Butterworth  | F      | 1985-01-01 |
| 111784 | d009    | 1988-10-17 | 1992-09-08 | 111784 | 1956-06-14 | Marjo       | Giarratana   | F      | 1988-02-12 |
| 111877 | d009    | 1992-09-08 | 1996-01-03 | 111877 | 1962-10-18 | Xiaobin     | Spinelli     | F      | 1991-08-17 |
| 111939 | d009    | 1996-01-03 | 9999-01-01 | 111939 | 1960-03-25 | Yuchang     | Weedman      | M      | 1989-07-10 |
+--------+---------+------------+------------+--------+------------+-------------+--------------+--------+------------+
24 rows in set (0.01 sec)
```

## 2. 列の選択

部署ごとに、部署番号、歴代のマネージャーの従業員番号、マネージャーのファーストネーム、マネージャーのラストネームを取得してください。

```sql
mysql> SELECT dept_manager.dept_no, dept_manager.emp_no, employees.first_name, employees.last_name FROM dept_manager JOIN employees ON dept_manager.emp_no = employees.emp_no;
+---------+--------+-------------+--------------+
| dept_no | emp_no | first_name  | last_name    |
+---------+--------+-------------+--------------+
| d001    | 110022 | Margareta   | Markovitch   |
| d001    | 110039 | Vishwani    | Minakawa     |
| d002    | 110085 | Ebru        | Alpin        |
| d002    | 110114 | Isamu       | Legleitner   |
| d003    | 110183 | Shirish     | Ossenbruggen |
| d003    | 110228 | Karsten     | Sigstam      |
| d004    | 110303 | Krassimir   | Wegerle      |
| d004    | 110344 | Rosine      | Cools        |
| d004    | 110386 | Shem        | Kieras       |
| d004    | 110420 | Oscar       | Ghazalie     |
| d005    | 110511 | DeForest    | Hagimont     |
| d005    | 110567 | Leon        | DasSarma     |
| d006    | 110725 | Peternela   | Onuegbe      |
| d006    | 110765 | Rutger      | Hofmeyr      |
| d006    | 110800 | Sanjoy      | Quadeer      |
| d006    | 110854 | Dung        | Pesch        |
| d007    | 111035 | Przemyslawa | Kaelbling    |
| d007    | 111133 | Hauke       | Zhang        |
| d008    | 111400 | Arie        | Staelin      |
| d008    | 111534 | Hilary      | Kambil       |
| d009    | 111692 | Tonny       | Butterworth  |
| d009    | 111784 | Marjo       | Giarratana   |
| d009    | 111877 | Xiaobin     | Spinelli     |
| d009    | 111939 | Yuchang     | Weedman      |
+---------+--------+-------------+--------------+
24 rows in set (0.01 sec)
```

## 3. 複数の内部結合

部署ごとに、部署番号、部署名、歴代のマネージャーの従業員番号、マネージャーのファーストネーム、マネージャーのラストネームを取得してください。

```sql
mysql> SELECT departments.dept_no, departments.dept_name, dept_manager.emp_no, employees.first_name, employees.last_name FROM departments JOIN dept_manager ON departments.dept_no = dept_manager.dept_no JOIN employees ON dept_manager.emp_no = employees.emp_no;
+---------+--------------------+--------+-------------+--------------+
| dept_no | dept_name          | emp_no | first_name  | last_name    |
+---------+--------------------+--------+-------------+--------------+
| d009    | Customer Service   | 111692 | Tonny       | Butterworth  |
| d009    | Customer Service   | 111784 | Marjo       | Giarratana   |
| d009    | Customer Service   | 111877 | Xiaobin     | Spinelli     |
| d009    | Customer Service   | 111939 | Yuchang     | Weedman      |
| d005    | Development        | 110511 | DeForest    | Hagimont     |
| d005    | Development        | 110567 | Leon        | DasSarma     |
| d002    | Finance            | 110085 | Ebru        | Alpin        |
| d002    | Finance            | 110114 | Isamu       | Legleitner   |
| d003    | Human Resources    | 110183 | Shirish     | Ossenbruggen |
| d003    | Human Resources    | 110228 | Karsten     | Sigstam      |
| d001    | Marketing          | 110022 | Margareta   | Markovitch   |
| d001    | Marketing          | 110039 | Vishwani    | Minakawa     |
| d004    | Production         | 110303 | Krassimir   | Wegerle      |
| d004    | Production         | 110344 | Rosine      | Cools        |
| d004    | Production         | 110386 | Shem        | Kieras       |
| d004    | Production         | 110420 | Oscar       | Ghazalie     |
| d006    | Quality Management | 110725 | Peternela   | Onuegbe      |
| d006    | Quality Management | 110765 | Rutger      | Hofmeyr      |
| d006    | Quality Management | 110800 | Sanjoy      | Quadeer      |
| d006    | Quality Management | 110854 | Dung        | Pesch        |
| d008    | Research           | 111400 | Arie        | Staelin      |
| d008    | Research           | 111534 | Hilary      | Kambil       |
| d007    | Sales              | 111035 | Przemyslawa | Kaelbling    |
| d007    | Sales              | 111133 | Hauke       | Zhang        |
+---------+--------------------+--------+-------------+--------------+
24 rows in set (0.01 sec)
```


## 4. 絞り込み

部署ごとに、部署番号、部署名、現在のマネージャーの従業員番号、マネージャーのファーストネーム、マネージャーのラストネームを取得してください。

```sql
mysql> SELECT departments.dept_no, departments.dept_name, dept_manager.emp_no, employees.first_name, employees.last_name FROM departments JOIN dept_manager ON departments.dept_no = dept_manager.dept_no JOIN employees ON dept_manager.emp_no = employees.emp_no WHERE dept_manager.to_date = '9999-01-01';
+---------+--------------------+--------+------------+------------+
| dept_no | dept_name          | emp_no | first_name | last_name  |
+---------+--------------------+--------+------------+------------+
| d001    | Marketing          | 110039 | Vishwani   | Minakawa   |
| d002    | Finance            | 110114 | Isamu      | Legleitner |
| d003    | Human Resources    | 110228 | Karsten    | Sigstam    |
| d004    | Production         | 110420 | Oscar      | Ghazalie   |
| d005    | Development        | 110567 | Leon       | DasSarma   |
| d006    | Quality Management | 110854 | Dung       | Pesch      |
| d007    | Sales              | 111133 | Hauke      | Zhang      |
| d008    | Research           | 111534 | Hilary     | Kambil     |
| d009    | Customer Service   | 111939 | Yuchang    | Weedman    |
+---------+--------------------+--------+------------+------------+
9 rows in set (0.00 sec)
```

## 5. 給与

従業員番号10001から10010の従業員ごとに、ファーストネーム、ラストネーム、いつからいつまで給与がいくらだったかを取得してください。

## 6. 内部結合と外部結合の違い

INNER JOIN と OUTER JOIN の違いについて、SQL 初心者にわかるように説明してください。またどのように使い分けるのかも合わせて説明してください。

### 内部結合
結合するのは2つのテーブルだけ! レコードが一致するものだけ
- 2つのテーブルのうち、指定したフィールドの値が一致するレコードのみを抽出する。
- 結合条件に一致するレコードのみを抽出するため、選択されないレコードが存在する場合がある。
- INNNER JOIN句 と ON句 を追記すれば、、ある基準テーブルに対する内部結合が可能です。  
あくまで繋げるのは2つのテーブルで、メインになるテーブルがあり、それに対して順番に結合していく。

### 外部結合

- 一方のテーブルは全てのレコードが選択され、もう一方のテーブルは条件に該当するレコードのみが選択される
- ない部分には「null」が入る  
- 1つ目のテーブルから全てのレコードを選択するときはLEFT OUTER JOINを使います。
- 2つ目のテーブルから全てのレコードを選択するときはRIGHT OUTER JOINを使います。
- ON句にて結合条件を指定する  
※OUTERは省略可能なので、LEFT JOIN/RIGHT JOINと記述することも可能

