delimiter //

create function year_difference_from_january(input_year int)
returns int
deterministic
begin
    -- return the difference in years between 'input_year-01-01' and the current date
    return timestampdiff(
        year,
        str_to_date(concat(input_year, '-01-01'), '%Y-%m-%d'),
        curdate()
    );
end //

delimiter ;

use pandemic;
select
    year,
    year_difference_from_january(year) as year_difference
from
    infectious_cases_normalized;
