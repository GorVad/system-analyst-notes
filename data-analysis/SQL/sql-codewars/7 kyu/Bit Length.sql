/*
Given a demographics table in the following format:
** demographics table schema **
id
name
birthday
race
you need to return the same table where all text fields (name & race) are changed to the bit length of the string.

https://www.codewars.com/kata/594900e16fd782a607000059/sql
*/

select
  demo.id
  , bit_length(demo.name) as name
  , demo.birthday
  , bit_length(demo.race) as race
from demographics as demo