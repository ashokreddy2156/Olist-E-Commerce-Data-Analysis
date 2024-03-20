use olist;
-- Data Discription
/*
	Olist is a Brazilian E- Commerce platform connects small & medium sized bussiness to customers across Brazil
    - Platform operates as market place, where marchants can list products & servicrs and customers can 
      browse & purchase them online.
	- It contains information of around 100K orders from 2016 to 2018, made at multiple market places across Brazil
    
    - Its Featurs allow viewing orders from multiple dimentions :
			- Order_status, price, Payment_type, Frieight_Performance 
            - Product attributes and finally customer reviews and comments 
	- 9 DataSets
		- olist_orders_dataset
		- olist_customers_dataset
        - olist_order_items_dataset
        - olist_order_payments_dataset
        - olist_order_reviews_datast
        - olist_products_dataset
        - product_category_name_translation
        - olist_sellers_dataset
        - olist_geo_location_dataset
*/
-- Task
/* 
	To Explore Clean and analyze the Olist E - Commerce public datasets 
	
*/
-- Out line of the challenges 
/*
	1. Explore Dataset and perform Data Visualization
    2. Data cleaning
    3. Answer Bussiness questions & perform Exploratory Data analysis
    4. Share insights and Recommendations.
*/

-- Data Cleaning 
-- Orders Table 
/* while importing data in to sql, due to the presence of blanks, all timestamp type columns are
	by default considered as text type. 
    -- to convert them back to timestamp
		-- first replace missing with nulls
        -- change texr to timestamp 
 or 
  -- sql accepts yyyy-mm-dd format only 
  -- so change dd-mm-yyyy 

*/

-- Update empty strings to NULL values in the specified columns
UPDATE olist.orders
SET 
    order_approved_at = NULLIF(order_approved_at, ''),
    order_delivered_carrier_date = NULLIF(order_delivered_carrier_date, ''),
    order_delivered_customer_date = NULLIF(order_delivered_customer_date, '');

-- Change data type to timestamp
ALTER TABLE olist.orders
MODIFY COLUMN order_approved_at TIMESTAMP NULL,
MODIFY COLUMN order_delivered_carrier_date TIMESTAMP NULL,
MODIFY COLUMN order_delivered_customer_date TIMESTAMP NULL;
desc orders;
select * from orders
where order_status <> "delivered";

-- Olist_products_dataset
/*
	Produts table has 610 missing values in following columns
	product_category_name, product_name_lenght, product_description_lenght, product_photos_qty,
    product_weight_g, product_length_cm, product_height_cm, product_width_cm
    -- i have replaced missing values in product_category_name with "na" since it is of text data type
    -- and rest of the columns are of int type so missing vakues are replaced with "0"
*/
select * from olist_products_dataset;
select * from olist_products_dataset
where product_category_name = "na";
select * from orders;

--  EDA 
-- TOTAL SALES

select concat('R$ ',format(sum(payment_value),2,'pt_BR') )as Total_Sales
from olist_order_payments_dataset;

 -- pt_BR protuguese(Brazil)

-- TOTAL ORDERS

select count(*) as Total_Orders from orders;

-- TOTAL CUSTOMERS

select count(*) as Total_Customes from olist_customers_dataset;

-- TOTAL SELLERS

select count(*) as Total_Sellers from olist_sellers_dataset;

-- AVERAGE REVIEW SCORE
select * from olist_order_reviews_dataset;
select round(avg(review_score),2)as Avg_Review_Score from olist_order_reviews_dataset;


-- 1. WEEKDAY VS WEEKEND (ORDER_PURCHASE_TIMESTAMP) PAYMENT STATISTICS
select * from orders;
select * from olist_order_payments_dataset;

SELECT dayofweek(order_purchase_timestamp) as day_of_week from orders;
SELECT 
	CASE WHEN dayofweek(o.order_purchase_timestamp) IN (1,7) THEN "Weekend"
    ELSE "Weekday"
    END AS weekday_weekend,
    concat('R$ ',format(sum(py.payment_value),2,'pt_BR')) as Total_Amount,
    concat('R$ ',FORMAT(AVG(py.payment_value),2,'pt_BR')) as Averge_Amout
FROM orders o
JOIN olist_order_payments_dataset py on o.order_id = py.order_id
group by weekday_weekend;


-- 2. NUMBER OF ORDERS WITH REVIEW SCORE 5 AND PAYMENT TYPE AS CREDIT CARD.

select r.review_score,py.payment_type, count(distinct(r.order_id)) from olist_order_reviews_dataset r
join olist_order_payments_dataset py on r.order_id = py.order_id
where r.review_score = 5 and py.payment_type = "credit_card" ;
-- group by py.payment_type; 

-- 3. AVERAGE NUMBER OF DAYS TAKEN FOR ORDER_DELIVERED_CUSTOMER_DATE FOR PET_SHOP
 select * from orders;
select * from olist_products_dataset;

select round(avg(datediff(o.order_delivered_customer_date,o.order_purchase_timestamp)),2) as Delivery_Lead_time
from orders o
inner join olist_order_items_dataset oi on o.order_id = oi.order_id
inner join olist_products_dataset p on p.product_id = oi.product_id
where p.product_category_name = "pet_shop" ; --  and o.order_status = "delivered";


-- 4. Average price and payment values from customers of sao paulo city
select * from olist_order_payments_dataset;
select * from olist_customers_dataset;
select * from orders;
select * from olist_order_items_dataset;

select c.customer_city, 
concat('R$ ',format(avg(oi.price),2)) as Average_Price,
concat('R$ ',format(avg(py.payment_value),2)) as Average_Payment_Value
from olist_customers_dataset c
inner join orders o on c.customer_id = o.customer_id
inner join olist_order_payments_dataset py on o.order_id  = py.order_id
inner join olist_order_items_dataset oi on o.order_id = oi.order_id
where customer_city = "sao paulo"
group by c.customer_city;
-- 




-- 5. Relationship between shipping days (order_delivered_customer_date - order_purchase_timestamp) Vs review scores.
select * from orders;
select * from olist_order_reviews_dataset;

select  r.review_score,
		round(avg(datediff(o.order_delivered_customer_date,o.order_purchase_timestamp)),2) as Average_shipping_Days
from orders o 
inner join olist_order_reviews_dataset r on o.order_id = r.order_id
where order_delivered_customer_date is not null
group by r.review_score
order by r.review_score;



