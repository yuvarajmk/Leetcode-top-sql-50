--Percentage of Users Attended a Contest
with full_table as (
    select u.user_id user_id, rc.contest_id
    from users u cross join 
    (select contest_id
    from register
    group by contest_id) rc
)
select f.contest_id,   round(count(r.user_id)*100/count(f.user_id),2) percentage
from full_table f left join register r on (f.user_id = r.user_id and f.contest_id = r.contest_id)
group by f.contest_id
order by 2 desc, 1 
