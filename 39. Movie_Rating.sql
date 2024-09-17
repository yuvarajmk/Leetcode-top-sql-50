--Movie Rating
with user_rating as (
select user_id, count(rating) cnt_movies
from movierating
group by user_id 
),
user_ranking as (
    select u.user_id, u.name, rank() over (order by cnt_movies desc) rk
    from user_rating ur inner join users u on (u.user_id = ur.user_id)
),
movie_rating as (
    select movie_id, sum(rating)/count(user_id) avg_rating
    from movierating mr
    where to_char(created_at,'YYYY-MM') = '2020-02'
    group by movie_id
),
movie_ranking as (
    select m.movie_id, m.title, rank() over (order by avg_rating desc) rk
    from movie_rating mr inner join movies m on (mr.movie_id = m.movie_id)
)
select min(name) results
from user_ranking
where rk = 1
union all
select min(title)
from movie_ranking
where rk = 1
