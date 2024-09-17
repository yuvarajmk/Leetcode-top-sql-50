--User Activity for the Past 30 Days I
select to_Char(activity_date,'YYYY-MM-DD') day, count(distinct user_id) active_users
from activity
where activity_date between to_date('2019-07-27','YYYY-MM-DD')-29 and to_date('2019-07-27','YYYY-MM-DD')
group by activity_date
