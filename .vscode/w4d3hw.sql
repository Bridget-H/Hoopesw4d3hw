
--Homework
--q1
SELECT customer.address_id, address.address_id,address.district
FROM customer
RIGHT JOIN address
ON customer.address_id = address.address_id
WHERE address.district LIKE 'Texas';

--q2
SELECT customer.customer_id, customer.first_name, customer.last_name, payment.customer_id, payment.amount
FROM customer
RIGHT JOIN payment
ON customer.customer_id = payment.customer_id
WHERE payment.amount > 6.99;

--q3
SELECT *
FROM customer
WHERE customer_id IN (
    SELECT customer_id
    FROM payment
    GROUP BY customer_id
    HAVING SUM(amount) > 175
);

--q4
SELECT *
FROM city
WHERE city.city LIKE 'Nepal';

--q5 :(
SELECT*
FROM rental

SELECT *
FROM staff

SELECT staff.staff_id, staff.first_name, staff.last_name, rental.staff_id
FROM rental
RIGHT JOIN staff
ON staff.staff_id = rental.staff_id
WHERE stafff_id IN (
    SELECT staff_id
    FROM rental
    GROUP BY rental.staff_id
    HAVING COUNT(rental.staff_id)
);

--q6 :(
SELECT *
FROM film_actor
WHERE film_actor.film_id IN (
    SELECT film_id
    FROM film_actor
    GROUP BY film_id
    HAVING SUM(film_actor.actor_id)
);

--q7 :(

SELECT film_actor.actor_id, film_actor.film_id, actor.actor_id, actor.first_name, actor.last_name
FROM film_actor
RIGHT JOIN actor
ON film_actor.actor_id = actor.actor_id
HAVING COUNT(DISTINCT film_actor.actor_id)
ORDER BY film_actor.actor_id DESC;

--q8 ANSWER: 9

SELECT COUNT(district)
FROM address
GROUP BY district
HAVING COUNT(district) > 5;