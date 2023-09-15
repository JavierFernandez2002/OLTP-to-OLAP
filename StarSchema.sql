CREATE TABLE dimCustomer
(
customer_key SERIAL PRIMARY KEY,
customer_id smallint NOT NULL,
first_name varchar(45) NOT NULL,
last_name varchar(45)NOT NULL,
email varchar(50),
address varchar(50) NOT NULL,
address2 varchar(50),
ditrict varchar(20) NOT NULL,
city varchar(50) NOT NULL,
country varchar(50) NOT NULL,
postal_code varchar(10),
phone varchar(20) NOT NULL,
active smallint NOT NULL,
create_date timestamp NOT NULL,
start_date date NOT NULL,
end_date date NOT NULL
);

CREATE TABLE dimMovie
(
movie_key SERIAL PRIMARY KEY,
film_id smallint NOT NULL,
title varchar(255) NOT NULL,
description text,
release_year year,
language varchar(20) NOT NULL,
original_language varchar(20),
rental_duration smallint NOT NULL,
length smallint NOT NULL,
rating varchar(5) NOT NULL,
special_features varchar(60) NOT NULL
);

CREATE TABLE dimStore
(
store_key SERIAL PRIMARY KEY,
store_id smallint NOT NULL,
address varchar(50) NOT NULL,
address2 varchar(50),
district varchar(20) NOT NULL,
city varchar(50) NOT NULL,
country varchar(50) NOT NULL,
postal_code varchar(10),
manager_first_name varchar(45) NOT NULL,
manager_last_name varchar(45) NOT NULL,
start_date date NOT NULL,
end_date date NOT NULL
);
CREATE TABLE dinDate
(
date_key integer NOT NULL PRIMARY KEY,
date date NOT NULL,
year smallint NOT NULL,
quarter smallint NOT NULL,
month smallint NOT NULL,
day smallint NOT NULL,
week smallint NOT NULL,
is_weekend boolean
);

INSERT INTO dimDate
(date_key,date,year,quarter,month,day,week,is_weekend)
SELECT
date(payment_date) as date,
EXTRACT(year from paymant_date) as date,
EXTRACT(quarther from paymant_date) as quarther,
EXTRACT(month from paymant_date) as month,
EXTRACT(day from paymant_date) as day,
EXTRACT(week from paymant_date) as week,
CASE WHEN EXTRACT(ISODOW FROM paymant_date) IN (6,7) THEN true ELSE false END as is_weekend
FROM payment;

INSERT INTO dimCustomer (customer_key, customer_id, first_name, last_name,
email, address, address2,district,city ,country ,postal_code ,phone , active, create_date, start_date ,end_date)
SELECT
c.customer_id as customer_key,
c.customer_id
c.first_name,
c.last_name,
c.email.
a.address,
a.address2,
a.disctrict,
ci.city,
co.country,
postal_code,
a.phone,
c.active,
c.create_date,
now() as start_date,
now() as end_date
FROM  customer c
JOIN address a ON (c.address_id = a.address_id)
JOIN city ci ON (a.city_id = ci.city_id)
JOIN country co ON (ci.country_id = co.country_id);

INSERT INTO dimStore(store_key ,store_id ,address ,address2 ,district ,
city ,country ,postal_code ,manager_first_name ,manager_last_name,
start_date date ,end_date)
SELECT
s.store_id as store_key,
s.store_id,
a.address,
a.address2,
a.district,
ci.city,
co.country,
a.postal_code,
s.first_name as manager_first_name,
s.last_name as manager_last_name,
now() as start_date,
now() as end_date
FROM staff s
JOIN address a (s.address_id = a.address_id)
JOIN city ci (a.city_id = ci.city_id)
JOIN country co (ci.country_id = co.country_id);

INSERT INTO donMovie(movie_key,film_id,title,description,release_year
,language,original_language,rental_duration,
length,rating,special_features)
f.film_id as movie_key,
f.film_id,
f.title,
f.description,
f.release_year,
l.language,
l.language as original_language,
f.rental_duration,
f.length,
f.rating,
f.special_features
FROM film f
JOIN language l ON (f.language_id = l.language_id);

CREATE factSales
(
sales_key SERIAL PRIMARY KEY,
date_key integer REFERENCES dimDate (date_key),
customer_key integer REFERENCES dimCustemer (customer_key),
movie_key integer REFERENCES dimMovie (movie_key),
store_key integer REFERENCES dimSotre (store_key),
sales_amount numeric
);

INSERT INTO factSales (date_key, customer_key,movie_key,store_key
sales_amount)
SELECT
TO_CHAR(payment_date :: DATE, 'yyyyMMDD')::integer AS date_key,
p.customer_id as customer_key,
i.film_id as movie_key,
i.store_id as store_key,
p.amount as sales_amount
FROM payment p
JOIN rental r ON (p.rental_id = r.rental_id)
JOIN inventory i ON (r.inventory_id = i.inventory_id);