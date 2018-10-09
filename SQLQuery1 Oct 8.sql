select Name, count (Province) AS city_count
from city
where Country = 'USA'
group by Name
having count (Province) >1
order by Name desc
