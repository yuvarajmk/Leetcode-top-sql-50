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
---
with u_cnt as (select count(user_id) cnt from users )
select contest_id, round(count(r.user_id)/min(u_cnt.cnt)*100,2) as percentage
from register r left join u_cnt on (1=1)
group by contest_id
order by percentage desc, contest_id
SELECT 
  contest_id, -- The ID of the contest
  ROUND(
    COUNT(DISTINCT user_id) * 100 / ( -- Calculate the percentage of users
      SELECT 
        COUNT(user_id) -- Total number of unique users
      FROM 
        Users
    ), 
    2
  ) AS percentage -- The percentage of users registered for each contest, rounded to 2 decimal places
FROM 
  Register -- The table containing registration information
GROUP BY 
  contest_id -- Group the data by contest ID
ORDER BY 
  percentage DESC, -- Order the results by percentage in descending order
  contest_id; -- Then order by contest ID for ties
