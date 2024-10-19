# goit-rdb-fp
Final project for Relational Databases Course 

## Project Structure
* `task-1`
  * `create_schema.sql` creating a `pandemic` schema and a table for importing the data
  * `first_import_error.txt` errors that happened during the first import attempt and signaled that some entities don't have a code => `code` was made nullable
  * `infectious_cases_data_sample.png` presenting the portion of the data that was imported into newly created table
  * `infectious_cases_diagram` diagram representation of created table
* `task-2`
  * `countries_table.png` presents data in the `countries` table
  * `diagram_after_normalization.png` diagram with all tables of the normalized data structure:
    * `countries` - keeping the countries codes
    * `entities` - entities from the original data referencing the `countries`
    * `infectious_cases_normalized` - normalized data table, referencing the `entities` and `countries`
    * the `infectious_cases` table is kept in the original format as source of truth
  * `normalize.sql` - script for creating normalized tables and filling them with data
  * `normalized_infectious_cases.png` - presents sample of data from the newly created normalized table
* `task-3`
  * `number_rabies_analysis.sql` - analysing the number of rabies cases grouped by entity and country code
  * `number_rabies_result.png` - result of query execution
* `task-4`
  * `date_diff.sql` - query for calculating the difference in years
  * `result.png` - screenshot of result
* `task-5`
  * `year_diff_function.sql` - defining and executing the function for calculating the year difference
    * results are the same as in previous task