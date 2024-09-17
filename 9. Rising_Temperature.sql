--Rising Temperature
select id from (
select id, recorddate, lag(recorddate,1) over (order by recorddate) precorddate, temperature , lag(temperature ,1) over (order by recorddate) ptemperature 
from weather
order by recorddate) w1
where recorddate - 1= precorddate and temperature > ptemperature
