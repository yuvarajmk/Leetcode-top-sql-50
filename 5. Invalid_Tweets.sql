--Invalid Tweets
select tweet_id
from tweets
where length(nvl(content,0))>15
