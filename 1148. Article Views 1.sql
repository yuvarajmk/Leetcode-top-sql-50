-- 1148. Article Views 1

select author_id id
from views
where author_id = viewer_id
group by author_id
order by id