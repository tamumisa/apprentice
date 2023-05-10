SELECT ir.campaign_id,
       ir.influencer_id,
       ir.good,
       ir.bad,
       ir.review_detail,
       ir.created_at,
       cp.company_id,
       cm.name,
       cm.service_name,
       concat(ad.last_name," ",ad.first_name)
FROM influencer_reviews ir
LEFT JOIN campaigns cp ON ir.campaign_id = cp.id
LEFT JOIN companies cm ON cp.company_id = cm.id
LEFT JOIN admins ad ON cm.cs_id = ad.id
where concat(ad.last_name," ",ad.first_name) = '{{ 担当CS }}'
and ir.bad = 1