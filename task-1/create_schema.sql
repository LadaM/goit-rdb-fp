create schema if not exists pandemic;
use pandemic;

create table if not exists infectious_cases
(
    Entity               char(255) not null,
    Code                 char(3)   null, -- ~1000 entries don't have a code
    Year                 year      not null,
    Number_yaws          decimal   null,
    polio_cases          decimal   null,
    cases_guinea_worm    decimal   null,
    Number_rabies        decimal   null,
    Number_malaria       decimal   null,
    Number_hiv           decimal   null,
    Number_tuberculosis  decimal   null,
    Number_smallpox      decimal   null,
    Number_cholera_cases decimal   null
);
