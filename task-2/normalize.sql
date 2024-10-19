use pandemic;

-- create the countries table
create table if not exists countries (
    id int auto_increment primary key,
    code char(3) unique
);

-- create the entities table
create table if not exists entities (
    id int auto_increment primary key,
    entity_name varchar(255),
    country_id int,
    foreign key (country_id) references countries(id)
);

-- Step 3: Populate the countries table with distinct country codes from infectious_cases
-- Ensure no NULL values are inserted into the countries table
insert into countries (code)
select distinct code
from infectious_cases
where code is not null
and code not in (select code from countries);

-- Step 4: Populate the entities table with distinct entities and their country reference
-- If a country code is NULL, the country_id will also be NULL
insert into entities (entity_name, country_id)
select distinct ic.entity, c.id
from infectious_cases ic
left join countries c on ic.code = c.code
where (ic.entity, c.id) not in (select entity_name, country_id from entities);

-- Step 5: Create the infectious_cases_normalized table (if it doesn't exist)
create table if not exists infectious_cases_normalized (
    id int auto_increment primary key,
    entity_id int,
    country_id int,
    year year,
    number_yaws decimal(10),
    polio_cases decimal(10),
    cases_guinea_worm decimal(10),
    number_rabies decimal(10),
    number_malaria decimal(10),
    number_hiv decimal(10),
    number_tuberculosis decimal(10),
    number_smallpox decimal(10),
    number_cholera_cases decimal(10),
    foreign key (entity_id) references entities(id),
    foreign key (country_id) references countries(id)
);

-- Step 6: Populate the infectious_cases_normalized table with data from infectious_cases
-- Handles cases where country_id can be NULL
insert into infectious_cases_normalized (
    entity_id, country_id, year, number_yaws, polio_cases, cases_guinea_worm,
    number_rabies, number_malaria, number_hiv, number_tuberculosis,
    number_smallpox, number_cholera_cases
)
select
    e.id as entity_id,
    e.country_id,  -- Use country_id from entities, which may be NULL
    ic.year,
    ic.number_yaws,
    ic.polio_cases,
    ic.cases_guinea_worm,
    ic.number_rabies,
    ic.number_malaria,
    ic.number_hiv,
    ic.number_tuberculosis,
    ic.number_smallpox,
    ic.number_cholera_cases
from
    infectious_cases ic
join
    entities e on ic.entity = e.entity_name;
