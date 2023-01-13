/*
https://www.codewars.com/kata/5817b124e7f4576fd00020a2
*/

select title
  from film f
  join film_actor a1 on a1.film_id = f.film_id and a1.actor_id = 105
  join film_actor a2 on a2.film_id = a1.film_id and a2.actor_id = 122
 order by title;

--or

select film.title
from film join film_actor on film.film_id = film_actor.film_id
          join actor on film_actor.actor_id = actor.actor_id
where actor.actor_id in (105, 122)
group by film.title
having count(film.title) >= 2
order by film.title;

--or

select film.title
from film as film inner join film_actor as filmact on film.film_id = filmact.film_id
where filmact.actor_id in (105,122)
group by film.title
having count(*) = 2
order by film.title
