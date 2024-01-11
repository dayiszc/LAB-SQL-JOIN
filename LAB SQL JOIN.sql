use sakila;
select -- LIST THE NUMBER OF FILMS PER CATEGORY
    c.name as category,
    COUNT(fc.film_id) as film_count
from
    category c
left join
    film_category fc on c.category_id = fc.category_id
group by
    c.category_id, c.name
order by
    film_count desc;
    
-- Display the first and the last names, as well as the address, of each staff member.
select staff_id, first_name, last_name, address_id from staff;

-- Display the total amount rung up by each staff member in August 2005.
select
    staff.staff_id,
    CONCAT(staff.first_name, ' ', staff.last_name) as staff_name,
    SUM(payment.amount) as total_amount
from
    payment
join
    staff on payment.staff_id = staff.staff_id
where
    DATE_FORMAT(payment.payment_date, '%Y-%m') = '2005-08'
group by
    staff.staff_id, staff_name
order by
    total_amount desc;
    
-- List all films and the number of actors who are listed for each film.
select
    f.title as film_title,
    COUNT(fa.actor_id) as actor_count
from
    film f
join
    film_actor fa on f.film_id = fa.film_id
group by
    f.film_id, f.title
order by
    actor_count desc;
    
-- Using the payment and the customer tables as well as the JOIN command, list the total amount paid by each customer. List the customers alphabetically by their last names.
select
	c.customer_id, concat(c.last_name, ', ' , c.first_name) as customer_name,
    sum(p.amount) as total_amount_paid
from customer c
left join payment p on c.customer_id = p.customer_id
group by c.customer_id, customer_name
order by c.last_name, c.first_name
