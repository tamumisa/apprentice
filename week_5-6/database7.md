SELECT c.id キャンペーンID,
       c.title キャンペーン名,
       c.company_id 会社ID,
       co.name 会社名,
       c.is_real_store 業態,
       co.campaign_prefecture 来店先住所,
       c.genre_id ジャンルID,
       ci.influencer_id,
       i.name インフルエンサーの名前,
       i.instagram インスタグラムID,
       i.followers フォロワー数,
       ci.post_url,
       ci.post_id,
       ci.id キャンペーン応募順,
       p.reach リーチ数,
       p.engagement エンゲージメント数,
       p.like_count いいね数,
       p.comments_count コメント数,
       p.saved 保存数,
       p.timestamp 投稿報告日時
FROM campaigns c
LEFT JOIN campaign_influencers ci ON c.id = ci.campaign_id
LEFT JOIN influencers i ON i.id = ci.influencer_id
LEFT JOIN companies co ON co.id = c.company_id
LEFT JOIN posts p ON p.id = ci.post_id
WHERE ci.status = "posted"
ORDER BY ci.id DESC;