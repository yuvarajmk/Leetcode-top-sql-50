--Investments in 2016
select sum(tiv_2016) tiv_2016
from insurance i1 
where exists (Select 1 from insurance i2 where i1.tiv_2015 = i2.tiv_2015 and i1.pid  != i2.pid)
 and not exists (select 1 from insurance i2 where i1.lat = i2.lat and i1.lon = i2.lon and i1.pid != i2.pid)
