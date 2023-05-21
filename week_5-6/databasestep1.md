## ステップ1

テーブル設計をしてください。

テーブルごとにテーブル名、カラム名、データ型、NULL(NULL OK の場合のみ YES と記載)、キー（キーが存在する場合、PRIMARY/INDEX のどちらかを記載）、初期値（ある場合のみ記載）、AUTO INCREMENT（ある場合のみ YES と記載）を記載してください。また、外部キー制約、ユニークキー制約に関しても記載してください。

その際に、少なくとも次のことは満たしてください。

- アプリケーションとして成立すること(プログラムを組んだ際に仕様を満たして動作すること)
- 正規化されていること

**channels テーブル:**

| カラム名      | データ型     | NULL | キー         | 初期値 | AUTO INCREMENT |
| ------------ | ------------ | ---- | ------------ | ------ | -------------- |
| channel_id   |     INT      |      | PRIMARY KEY  |        |     YES       |
| channel_name |   VARCHAR(100)   |      |              |        |                |

**program_slots テーブル:**

| カラム名      | データ型     | NULL | キー         | 初期値 | AUTO INCREMENT |
| ------------ | ------------ | ---- | ------------ | ------ | -------------- |
| slot_id      |     INT      |      | PRIMARY KEY  |        |       YES     |
| channel_id   |     INT      |      | FOREIGN KEY  |        |                |
| start_time   |   DATETIME   |      |              |        |                |
| end_time     |   DATETIME  |      |              |        |                |

**programs テーブル:**

| カラム名             | データ型     | NULL | キー         | 初期値 | AUTO INCREMENT |
| ------------------ | ------------ | ---- | ------------ | ------ | -------------- |
| program_id         |     INT      |      | PRIMARY KEY  |        |       YES     |
| program_name       |   VARCHAR(100)    |     |              |        |                |
| program_description |              | YES  |              |        |                |
| genre              |              |      |              |        |                |

**series テーブル:**

| カラム名           | データ型     | NULL | キー         | 初期値 | AUTO INCREMENT |
| ------------------ | ------------ | ---- | ------------ | ------ | -------------- |
| series_id          |     INT      |      | PRIMARY KEY  |        |       YES     |
| program_id         |     INT      |      | FOREIGN KEY  |        |                |
| season_number      |              | YES  |              |        |                |

**episodes テーブル:**

| カラム名                 | データ型     | NULL | キー         | 初期値 | AUTO INCREMENT |
| ----------------------- | ------------ | ---- | ------------ | ------ | -------------- |
| episode_id              |      INT     |      | PRIMARY KEY  |        |       YES     |
| series_id               |      INT     |      | FOREIGN KEY  |        |                |
| episode_number          |              | YES  |              |        |                |
| episode_title           |     TEXT     |      |              |        |                |
| episode_description     |     TEXT     | YES  |              |        |                |
| episode_duration        |              |      |              |        |                |
| release_date            |  DATETIME   |      |              |        |                |

**episode_views テーブル:**

| カラム名               | データ型     | NULL | キー         | 初期値 | AUTO INCREMENT |
| ---------------------- | ------------ | ---- | ------------ | ------ | -------------- |
| episode_view_id        |       INT    |      | PRIMARY KEY  |        |      YES      |
| episode_id             |       INT    |      | FOREIGN KEY  |        |                |
| slot_id                |       INT    |      | FOREIGN KEY  |        |                |
| channel_id             |       INT    |      | FOREIGN KEY