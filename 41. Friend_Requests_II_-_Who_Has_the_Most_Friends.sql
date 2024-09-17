--Friend Requests II - Who Has the Most Friends
with tab as 
(select distinct requester_id id  from RequestAccepted  
union 
select distinct accepter_id  from RequestAccepted )
select id, num from (
select id, sum(num) num, rank() over (order by sum(num)desc) rk from (
 select 
 tab.id id, sum(case when r.requester_id is not null then 1 else 0 end) num
 from tab left join requestaccepted r on (tab.id = r.requester_id )  
  group by tab.id
  union all
  select 
 tab.id id, sum(case when a.accepter_id  is not null then 1 else 0 end) num
 from tab left join requestaccepted a on (tab.id = a.accepter_id  )  
  group by tab.id
)
group by id
)where rk=1
--
WITH all_ids AS (
   SELECT requester_id AS id 
   FROM RequestAccepted
   UNION ALL
   SELECT accepter_id AS id
   FROM RequestAccepted)
SELECT id, num
FROM 
   (
   SELECT id, 
      COUNT(id) AS num, 
      RANK () OVER(ORDER BY COUNT(id) DESC) AS rnk
   FROM all_ids
   GROUP BY id
   )t0
WHERE rnk=1
