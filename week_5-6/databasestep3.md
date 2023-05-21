## ステップ3

1. よく見られているエピソードを知りたいです。エピソード視聴数トップ3のエピソードタイトルと視聴数を取得してください。

```sql
SELECT episode_title, views_count
FROM episodes
JOIN episode_views ON episodes.episode_id = episode_views.episode_id
ORDER BY views_count DESC
LIMIT 3;
```

2. よく見られているエピソードの番組情報やシーズン情報も合わせて知りたいです。エピソード視聴数トップ3の番組タイトル、シーズン数、エピソード数、エピソードタイトル、視聴数を取得してください。

```sql
SELECT program_name, season_number, episode_number, episode_title, views_count
FROM programs
JOIN series ON programs.program_id = series.program_id
JOIN episodes ON series.series_id = episodes.series_id
JOIN episode_views ON episodes.episode_id = episode_views.episode_id
ORDER BY views_count DESC
LIMIT 3;
```

3. 本日の番組表を表示するために、本日、どのチャンネルの、何時から、何の番組が放送されるのかを知りたいです。本日放送される全ての番組に対して、チャンネル名、放送開始時刻(日付+時間)、放送終了時刻、シーズン数、エピソード数、エピソードタイトル、エピソード詳細を取得してください。なお、番組の開始時刻が本日のものを本日放送される番組とみなすものとします。

```sql
SELECT channel_name, CONCAT(CURDATE(), ' ', start_time) AS start_datetime, CONCAT(CURDATE(), ' ', end_time) AS end_datetime, season_number, episode_number, episode_title, episode_description
FROM program_slots
JOIN channels ON program_slots.channel_id = channels.channel_id
JOIN programs ON program_slots.channel_id = programs.program_id
JOIN series ON programs.program_id = series.program_id
JOIN episodes ON series.series_id = episodes.series_id
WHERE CURDATE() = DATE(start_time)
```

4. ドラマというチャンネルがあったとして、ドラマのチャンネルの番組表を表示するために、本日から一週間分、何日の何時から何の番組が放送されるのかを知りたいです。ドラマのチャンネルに対して、放送開始時刻、放送終了時刻、シーズン数、エピソード数、エピソードタイトル、エピソード詳細を本日から一週間分取得してください。

```sql
SELECT DATE_ADD(CURDATE(), INTERVAL n DAY) AS date, start_time, end_time, season_number, episode_number, episode_title, episode_description
FROM program_slots
JOIN channels ON program_slots.channel_id =