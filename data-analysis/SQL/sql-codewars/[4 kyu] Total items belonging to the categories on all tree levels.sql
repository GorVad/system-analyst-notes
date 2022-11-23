/*
Task
For each category in the tree-like categories table,
calculate how many records in the items table belong to it and its parent categories across all the tree levels.

Notes
Items can only belong to the leaves of the category tree
There will be multiple roots for separate category trees
Order the result by the id column

https://www.codewars.com/kata/5da48818dcf4d6002129a751/sql
theory: https://habr.com/ru/post/269497/
*/

with recursive count_items as
(
  select categories.id, categories.parent,
  (
    select count(items.id)
    from items where categories.id = items.category_id
  ) as total
  from categories
),
temp as
(
  select count_items.id, count_items.parent, count_items.total
  from count_items
  where id not in
    (
      select categories.parent
      from categories
      where parent is not null
    )

  union all

  select count_items.id, count_items.parent, (temp.total+count_items.total) as total
  from temp inner join count_items on temp.parent = count_items.id
)

select temp.id, sum(temp.total) as total
from temp
group by temp.id
order by temp.id