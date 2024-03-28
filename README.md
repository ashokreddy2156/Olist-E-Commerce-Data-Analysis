This repository encompasses an analysis of Olist E-Commerce, conducted utilizing a range of BI tools such as Excel, PowerBI, and Tableau, alongside exploratory data analysis carried out through SQL and Python.


-- Data Description

	Olist is a Brazilian E- Commerce platform connects small & medium sized business to customers across Brazil.
    - Platform operates as marketplace, where merchants can list products & services and customers can browse & purchase them online.
    - It contains information of around 100K orders from 2016 to 2018, made at multiple marketplaces across Brazil
    
    - Its Features allow viewing orders from multiple dimensions:
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

-- Task
 
	To Explore Clean and analyse the Olist E - Commerce public datasets 
	
-- Project Stages 
	1.Datasets
		-- Accessing Dataset
		-- Load Datasets
		-- Create Data models
	2.Exploration and Processing
		-- Identifying inconsistent format
		-- Clearing duplicates & missing values
		-- Other checks required
	3. Exploring Data and Analysis


-- Outline of the challenges 

    1. Explore Dataset and perform Data Visualization
    2. Data cleaning
    3. Answer Business questions & perform Exploratory Data analysis
    4. Share insights and Recommendations.



-- Data Cleaning 
-- Orders Table 

  while importing data into SQL, due to the presence of blanks, all timestamp type columns are by default considered as text type. 
    -- to convert them back to timestamp
    -- first replace missing with nulls
    -- change text to timestamp 
 or 
  -- SQL accepts yyyy-mm-dd format only 
  -- so change dd-mm-yyyy 
-- Products Table
     Delete nulls and missing values in products table.



-- Card Indicators

	1.Total Number of Orders
	2.Total Revenue Generated
	3.Total Profit Accumulated
	4.Total Number of Customers & Sellers
	5.Total Number of Products
	6.Average Payment Value per 
	7.Average Price
	8.Average Shipping Cost
	9.Average Payment
	10.Five-star Reviews
	11.Bad Reviews
	12.Average Delivery Time
	13.Average shipping days to Carrier
	14.Average shipping days from Carrier to Customer
	15.Delivary Rate

-- Key Performance Indicators 

   -- Divided into 4 sections
	I-Home
	  1.Revenue over weekend & weekdays
	  2.State wise Revenue
	  3.Top Rated Products
	  4.Best Selling Products

	II-Delivery
	  1.Delivary Lead Time for Category Pet Shop
	  2.Delivary Lead Time vs Average Price
	  3.Order Stats Across Brazil

	III-Revenue
 	  1.Price and Payment values of Sao Paulo City
	  2.Sales over Time / Revnue flow over Time

	IV - Reviews
	  1.Review Score vs Order Status
          2.Delivary Lead Time by Review Score
	  3.Top Comments Headline
	  4.Review Score vs Orders Count
	  5.Average Review Score

--Slicers 
 
   Few slicers are used gain detailed analysis about cards and KPI's. Which helps in  concluding accurate analysis.
  -- Slicers Included are 
	1.Time Line (Year)
	3.Payment Type
	4.Review Score
	5.State of Brazil
	6.Products
  
-- Insights & Suggestions	
	
	1.The Average Days to Delivery has significantly decreased by 87% between September 2016 and August 2018. This indicates an improvement in logistics and fulfilment processes, enhancing customer satisfaction and retention.
	2.The significant increase in Orders from 2016 to 2018 reflects a thriving e-commerce landscape, presenting opportunities for businesses to expand their market presence and invest in the growing online retail sector.
	3.The Product Categories like Sports Leisure, Toys, Houseware, Health Beauty, and Auto have 400 sellers each on an average. Sellers can also procure more inventory for products of Computer Accessories, Furniture Décor as these have higher order volumes compared to Auto, Toys, and Houseware which would help increase the profits while decreasing the days to delivery.


-- Recommendations

  --Based on the Analytical Insights, we would recommend the following strategies:
	1.Implement targeted Marketing Campaigns to capitalize on the popularity of top-selling categories and regions.
	2.Explore Partnerships or Incentives to encourage increased usage of credit cards or other preferred payment methods.
	3.Offer Promotions to drive weekend sales and balance the distribution of payment value throughout the week.
	4.Invest in technology and infrastructure to streamline order processing, improve delivery times, and enhance overall customer experience.
	5.Continuously monitor customer feedback and satisfaction metrics to identify areas for improvement and maintain high-quality service standards.


















