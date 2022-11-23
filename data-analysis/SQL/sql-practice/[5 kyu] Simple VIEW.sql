/*
For this challenge you need to create a VIEW.
This VIEW is used by a sales store to give out vouches to members who have spent over $1000 in departments that have brought
in more than $10000 total ordered by the members id.
The VIEW must be called members_approved_for_voucher then you must create a SELECT query using the view.

https://www.codewars.com/kata/5811527d9d278b242f000006/sql
*/

create view members_approved_for_voucher as
  select m.id, m.name, m.email, sum(p.price) as total_spending
  from sales as s
    inner join members as m on s.member_id = m.id
    inner join products as p on p.id = s.product_id
  where s.department_id in
  (
    select s.department_id
    from products as p inner join sales as s on p.id = s.product_id
    group by s.department_id
    having sum(p.price) > 10000
  )
  group by m.id
  having sum(p.price)>1000;

  SELECT * from members_approved_for_voucher
  order by id;