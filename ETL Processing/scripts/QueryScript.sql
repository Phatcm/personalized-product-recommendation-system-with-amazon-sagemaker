
SELECT * FROM public."GroceryData" limit 100  
SELECT * FROM "staging".customers  limit 100 
SELECT * FROM "staging".products  limit 100
SELECT * FROM core.reviews limit 100
SELECT * FROM core.products limit 100
SELECT count(*) FROM "staging".customers
SELECT count(*) FROM "staging".reviews
SELECT count(*) FROM "staging".products
SELECT count(*) FROM public."GroceryData"
SELECT count(*) FROM core.products
SELECT count(*) FROM core.reviews
SELECT count(*) FROM core.customers

SELECT customer_id ,COUNT(*) as duplicate_count
FROM "staging".customers
GROUP BY customer_id
HAVING COUNT(*) > 10 limit 200;



select * from "staging".customers
where customer_id = 10805
SELECT 
count(distinct customer_id)
FROM public."GroceryData" 

SELECT 
row_number() over (order by customer_id) as customer_pk,
distinct customer_id,
product_id,
helpful_votes,
vine
into "staging".customers
FROM public."GroceryData"

INSERT INTO "staging".customers (customer_id,product_id,helpful_votes,vine)
SELECT DISTINCT ON(customer_id) customer_id,product_id,helpful_votes,vine
FROM public."GroceryData"
GROUP BY customer_id


INSERT INTO "staging".products (product_id, product_title, product_category,product_parent)
SELECT DISTINCT ON(product_id) product_id, product_title, product_category,product_parent
FROM public."GroceryData"
--GROUP BY product_id

SELECT product_id ,COUNT(*) as duplicate_count
FROM "staging".products
GROUP BY product_id
HAVING COUNT(*) > 10 limit 200;

INSERT INTO "staging".reviews (review_id,product_id,customer_id,star_rating,review_headline,review_body,review_date,total_votes,vine,verified_purchase)
SELECT DISTINCT ON(review_id) review_id,product_id,customer_id,star_rating,review_headline,review_body,review_date,total_votes,vine,verified_purchase
FROM public."GroceryData" 



--INSERT INTO "staging".reviews (review_id,product_id,product_fk,customer_id,customer_fk,star_rating,review_header,review_body,review_date,total_votes,vine,verified_purchase)
SELECT review_id,f.product_id,p.product_pk as product_fk,c.customer_pk as customer_fk,f.customer_id,star_rating,review_headline,review_body,f.review_date,total_votes,f.vine,f.verified_purchase
FROM public."GroceryData" f
LEFT JOIN "staging".customers c
ON f.customer_id = c.customer_id
LEFT JOIN "staging".products p
ON f.product_id = p.product_id
limit 100

SELECT review_id,product_id,customer_id,star_rating,review_headline,review_body,review_date,total_votes,vine,verified_purchase
FROM public."GroceryData"
limit 100


CREATE INDEX idx_customer_id ON core.customers (customer_id);
CREATE INDEX idx_review_id ON core.reviews (review_id);
CREATE INDEX idx_product_id ON core.products (product_id);

select COUNT(DISTINCT review_date) from public."GroceryData" 
select  review_date from public."GroceryData" limit 100

SELECT TO_CHAR(g.review_date, 'YYYY-MM-DD') AS formatted_datetime
FROM public."GroceryData" g limit 100;

SELECT DISTINCT SPLIT_PART(TO_CHAR(g.review_date, 'YYYY-MM-DD'), '-', 1) AS Year
FROM public."GroceryData" g 

select count(distinct product_id) 
	from public."GroceryData" g 
	where SPLIT_PART(TO_CHAR(g.review_date, 'YYYY-MM-DD'), '-', 1)  = '2015'

SELECT y.year, COUNT(p.product_id) AS product_count
FROM year y
LEFT JOIN product p ON EXTRACT(YEAR FROM p.created_at) = y.year
GROUP BY y.year
ORDER BY y.year;

	
SELECT p.product_id, COUNT(r.review_id) AS total_reviews
FROM core.products p
inner join core.reviews r
on p.product_id = r.product_id
GROUP BY p.product_id limit 100

SELECT p.*,
COUNT(r.review_id) AS total_reviews,
COUNT(CASE WHEN r.star_rating > 3 THEN r.review_id END) AS good_reviews,
COUNT(CASE WHEN r.star_rating <= 3 THEN r.review_id END) AS bad_reviews
FROM staging.products p
inner join staging.reviews r
on p.product_id = r.product_id
--where r.star_rating >3
GROUP BY p.product_pk,p.product_id limit 100



select DISTINCT ON(product_pk) r.customer_fk,p.product_pk,p.product_title,p.product_category,r.star_rating,r.review_date from core.products p
left join core.reviews r
on p.product_pk = r.product_fk
order by p.product_pk ASC limit 100

SELECT * FROM core.reviews where product_id = '0268956898'
LIMIT 100
