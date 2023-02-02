/*
You are given a table named repositories, format as below:

** repositories table schema **

project
commits
contributors
address
The table shows project names of major cryptocurrencies, their numbers of commits and
contributors and also a random donation address ( not linked in any way :) ).

For each row: Return first x characters of the project name where x = commits.
Return last y characters of each address where y = contributors.

Return project and address columns only, as follows:

https://www.codewars.com/kata/5943a58f95d5f72cb900006a/sql
** output table schema **

project
address
Case should be maintained.
*/

select
  substring
  (
    repo.project,
    1,
    cast(repo.commits as int)
  ) as project,
  substring
  (
    repo.address,
    length(repo.address) - cast(repo.contributors as int) + 1
  ) as address
from repositories as repo;


select
  left (repo.project, cast(repo.commits as int)) as project,
  right (repo.address, cast(repo.contributors as int)) as address
from repositories as repo;
