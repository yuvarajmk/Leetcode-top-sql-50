--Confirmation Rate
select s.user_id , round(sum(case when coalesce(action,' ')='confirmed' then 1 else 0 end)/case when count(action)=0 then 1 else count(action) end,2)  confirmation_rate 
from signups s left join confirmations c on (s.user_id = c.user_id)
group by s.user_id
select s.user_id, case when count(c.action) != 0 then round(sum(case when c.action='confirmed' then 1 else 0 end)/count(c.action),2) else 0 end confirmation_rate 
from Signups s left join Confirmations c on (s.user_id = c.user_id)
group by s.user_id
