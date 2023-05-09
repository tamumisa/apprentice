SELECT  c.id キャンペーンID,
        c.title キャンペーン名,
        c.genre_id ジャンルID,
        i.instagram インスタグラムID,
        i.followers "フォロワー数",
        i.birth_date "IF誕生日",
        i.prefecture "IF都道府県"
        ci.post_id,
        ci.post_url,
        p.reach リーチ数,
        p.saved 保存数,
        p.timestamp 投稿報告日時
        g.name "性別",
FROM campaigns c
LEFT JOIN campaign_influencers ci ON c.id = ci.campaign_id
LEFT JOIN posts p ON p.id = ci.post_id
LEFT JOIN genders g ON g.id = i.gender_id
LEFT JOIN influencers i ON i.id = ci.campaign_id
LEFT JOIN influencer_genres ig ON ig.influencer_id = i.id
WHERE ci.status = "posted" AND p.reach >= 1000 AND g.name = "男性"
ORDER BY p.timestamp DESC