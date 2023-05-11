SELECT c.id キャンペーンID,
       c.title キャンペーン名,
       c. キャンペーン名,
       ir.bad,
       ir.review_detail,
       ir.created_at,
       cp.company_id,
       cm.name,
       cm.service_name,
       concat(ad.last_name," ",ad.first_name)
FROM campaigns cp
LEFT JOIN companies cm ON cp.company_id = cm.id
LEFT JOIN admins ad ON cm.cs_id = ad.id
where concat(ad.last_name," ",ad.first_name) = '{{ 担当CS }}'
and '{{ cm.name }}'