## ステップ2

実際にテーブルを構築し、データを入れましょう。その手順をドキュメントとしてまとめてください（アウトプットは手順のドキュメントです）。

具体的には、以下のことを行う手順のドキュメントを作成してください。

1. データベースを構築します
2. ステップ1で設計したテーブルを構築します
3. サンプルデータを入れます。サンプルデータはご自身で作成ください（ChatGPTを利用すると比較的簡単に生成できます）

**channels テーブル:**

| channel_id | channel_name  |
| ---------- | ------------- |
| 1          | ドラマ1チャンネル |
| 2          | ドラマ2チャンネル |
| 3          | アニメ1チャンネル |
| 4          | アニメ2チャンネル |
| 5          | スポーツチャンネル |
| 6          | ペットチャンネル |

**program_slots テーブル:**

| slot_id | channel_id | start_time | end_time   |
| ------- | ---------- | ---------- | ---------- |
| 1       | 1          | 08:00      | 09:00      |
| 2       | 2          | 09:00      | 10:00      |
| 3       | 3          | 10:00      | 11:00      |
| 4       | 4          | 11:00      | 12:00      |
| 5       | 5          | 12:00      | 13:00      |
| 6       | 6          | 13:00      | 14:00      |

**programs テーブル:**

| program_id | program_name | program_description | genre |
| ---------- | ------------ | ------------------- | ----- |
| 1          | ドラマ1         | ドラマ1の説明              | ドラマ   |
| 2          | ドラマ2         | ドラマ2の説明              | ドラマ   |
| 3          | アニメ1         | アニメ1の説明              | アニメ   |
| 4          | アニメ2         | アニメ2の説明              | アニメ   |
| 5          | スポーツ         | スポーツの説明              | スポーツ |
| 6          | ペット         | ペットの説明              | ペット |

**series テーブル:**

| series_id | program_id | season_number |
| --------- | ---------- | ------------- |
| 1         | 1          | 1             |
| 2         | 2          | 1             |
| 3         | 3          | 1             |
| 4         | 4          | 1             |

**episodes テーブル:**

| episode_id | series_id | episode_number | episode_title | episode_description | episode_duration | release_date |
| ---------- | --------- | -------------- | ------------- | ------------------- | ---------------- | ------------ |
| 1          | 1         | 1              | エピソード1         | エピソード1の説明          | 00:30:00         | 2023-01-01   |
| 2          | 1         | 2              | エピソード2         | エピソード2の説明          | 00:30:00         | 2023-01-08   |
| 3          | 2         | 1              | エピソード1         | エピソード1の説明          | 00:30:00         | 2023-01-15   |
| 4          | 3         | 1              | エピソード1         | エピソード1の説明          | 00:30:00         | 2023-01-22   |
| 5          | 4         | 1              | エピソード1         | エピソード1の説明          | 00:30:00         | 2023-01-29   |

**episode_views テーブル:**

| episode_view_id | episode_id | slot_id | channel_id | views_count |
| --------------- | ---------- | ------- | ---------- | ----------- |
| 1               | 1          | 1       | 1          | 1000        |
| 2               | 1          | 2       | 2          | 1500        |
| 3               | 2          | 3       | 3          | 2000        |
| 4               | 3          | 4       | 4          | 800         |
| 5               | 4          | 5       | 5          | 1200        |
| 6               | 5          | 6       | 6          | 500         |

手順のドキュメントは、他の人が見た時にその手順通りに実施すればテーブル作成及びサンプルデータ格納が行えるように記載してください。

なお、ステップ2は以下のことを狙っています。

- データを実際に入れることでステップ3でデータ抽出クエリを試せるようにすること
- 手順をドキュメントにまとめることで、自身がやり直したい時にすぐやり直せること
- 手順を人が同じように行えるようにまとめることで、ドキュメントコミュニケーション力を上げること

# テーブル構築手順

以下に、テーブルの構築手順をまとめました。手順に従ってテーブルの作成とサンプルデータの挿入を行ってください。

## channels テーブル

1. `channels` テーブルを作成します。

```sql
CREATE TABLE channels (
  channel_id INT PRIMARY KEY,
  channel_name VARCHAR(255)
);
```

2. サンプルデータを挿入します。

```sql
INSERT INTO channels (channel_id, channel_name)
VALUES
  (1, 'ドラマ1チャンネル'),
  (2, 'ドラマ2チャンネル'),
  (3, 'アニメ1チャンネル'),
  (4, 'アニメ2チャンネル'),
  (5, 'スポーツチャンネル'),
  (6, 'ペットチャンネル');
```

## program_slots テーブル

1. `program_slots` テーブルを作成します。

```sql
CREATE TABLE program_slots (
  slot_id INT PRIMARY KEY,
  channel_id INT,
  start_time TIME,
  end_time TIME,
  FOREIGN KEY (channel_id) REFERENCES channels(channel_id)
);
```

2. サンプルデータを挿入します。

```sql
INSERT INTO program_slots (slot_id, channel_id, start_time, end_time)
VALUES
  (1, 1, '08:00', '09:00'),
  (2, 2, '09:00', '10:00'),
  (3, 3, '10:00', '11:00'),
  (4, 4, '11:00', '12:00'),
  (5, 5, '12:00', '13:00'),
  (6, 6, '13:00', '14:00');
```

## programs テーブル

1. `programs` テーブルを作成します。

```sql
CREATE TABLE programs (
  program_id INT PRIMARY KEY,
  program_name VARCHAR(255),
  program_description VARCHAR(255),
  genre VARCHAR(255)
);
```

2. サンプルデータを挿入します。

```sql
INSERT INTO programs (program_id, program_name, program_description, genre)
VALUES
  (1, 'ドラマ1', 'ドラマ1の説明', 'ドラマ'),
  (2, 'ドラマ2', 'ドラマ2の説明', 'ドラマ'),
  (3, 'アニメ1', 'アニメ1の説明', 'アニメ'),
  (4, 'アニメ2', 'アニメ2の説明', 'アニメ'),
  (5, 'スポーツ', 'スポーツの説明', 'スポーツ'),
  (6, 'ペット', 'ペットの説明', 'ペット');
```

## series テーブル

1. `series` テーブルを作成します。

```sql
CREATE TABLE series (
  series_id INT PRIMARY KEY,
  program_id INT,
  season_number INT,
  FOREIGN KEY (program_id) REFERENCES programs(program_id)
);
```

2. サンプル

データを挿入します。

```sql
INSERT INTO series (series_id, program_id, season_number)
VALUES
  (1, 1, 1),
  (2, 2, 1),
  (3, 3, 1),
  (4, 4, 1);
```

## episodes テーブル

1. `episodes` テーブルを作成します。

```sql
CREATE TABLE episodes (
  episode_id INT PRIMARY KEY,
  series_id INT,
  episode_number INT,
  episode_title VARCHAR(255),
  episode_description VARCHAR(255),
  episode_duration TIME,
  release_date DATE,
  FOREIGN KEY (series_id) REFERENCES series(series_id)
);
```

2. サンプルデータを挿入します。

```sql
INSERT INTO episodes (episode_id, series_id, episode_number, episode_title, episode_description, episode_duration, release_date)
VALUES
  (1, 1, 1, 'エピソード1', 'エピソード1の説明', '00:30:00', '2023-01-01'),
  (2, 1, 2, 'エピソード2', 'エピソード2の説明', '00:30:00', '2023-01-08'),
  (3, 2, 1, 'エピソード1', 'エピソード1の説明', '00:30:00', '2023-01-15'),
  (4, 3, 1, 'エピソード1', 'エピソード1の説明', '00:30:00', '2023-01-22'),
  (5, 4, 1, 'エピソード1', 'エピソード1の説明', '00:30:00', '2023-01-29');
```

## episode_views テーブル

1. `episode_views` テーブルを作成します。

```sql
CREATE TABLE episode_views (
  episode_view_id INT PRIMARY KEY,
  episode_id INT,
  slot_id INT,
  channel_id INT,
  views_count INT,
  FOREIGN KEY (episode_id) REFERENCES episodes(episode_id),
  FOREIGN KEY (slot_id) REFERENCES program_slots(slot_id),
  FOREIGN KEY (channel_id) REFERENCES channels(channel_id)
);
```

2. サンプルデータを挿入します。

```sql
INSERT INTO episode_views (episode_view_id, episode_id, slot_id, channel_id, views_count)
VALUES
  (1, 1, 1, 1, 1000),
  (2, 1, 2, 2, 1500),
  (3, 2, 3, 3, 2000),
  (4, 3, 4, 4, 800),
  (5, 4, 5, 5, 1200),
  (6, 5, 6, 6, 500);
```

これでテーブルの作成とサンプルデータの挿入が完了しました。手順に沿って実施することで、テーブルとサンプルデータが正しく格納されます。
