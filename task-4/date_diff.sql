use pandemic;

select year,                                                                                         -- Original year
       str_to_date(concat(year, '-01-01'), '%Y-%m-%d')                                 as first_january,
       curdate()                                                                       as curr_date, -- Current date
       timestampdiff(year, str_to_date(concat(year, '-01-01'), '%Y-%m-%d'), curdate()) as year_difference
from infectious_cases_normalized
-- order by year_difference desc;
