use pandemic;

select e.entity_name,
       c.code,
       avg(icn.number_rabies) as avg_rabies,
       min(icn.number_rabies) as min_rabies,
       max(icn.number_rabies) as max_rabies,
       sum(icn.number_rabies) as sum_rabies
from infectious_cases_normalized icn
         join
     entities e on icn.entity_id = e.id
         join
     countries c on e.country_id = c.id
where icn.number_rabies is not null
group by e.entity_name, c.code
order by avg_rabies desc
limit 10;
