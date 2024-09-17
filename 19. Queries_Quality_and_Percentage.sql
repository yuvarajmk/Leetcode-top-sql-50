--Queries Quality and Percentage
select query_name, round(sum(rating/position)/count(rating),2) quality, round(sum(case when rating < 3 then 1 else 0 end)*100/count(rating),2) poor_query_percentage
from queries
where query_name is not null
group by query_name
