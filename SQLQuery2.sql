select * 
	from pizza_sales

--Total Revenue
SELECT SUM(total_price) as Total_Revenue
	FROM pizza_sales
--Total Pizzas Sold
SELECT SUM(quantity) as Total_pizza_sold 
	FROM pizza_sales
--Total Orders
SELECT COUNT(distinct order_id) as Total_orders
	FROM pizza_sales
--Average Order Value
SELECT cast(sum(total_price) / count(distinct order_id) as decimal(10,2)) as AVG_order_value
	FROM pizza_sales
--Average Pizzas Per Order
SELECT cast(cast(count(quantity)as decimal(10,2)) / cast(count(distinct order_id)as decimal(10,2)) as decimal(10,2)) as AVG_pizza_per_order
	FROM pizza_sales

--Daily Trend for Total Orders
SELECT DATENAME(DW,order_date) as dayes,
count(distinct order_id) as Total_orders
	from pizza_sales
	group by DATENAME(DW,order_date)
--MOnthly Trend for Total Orders
SELECT DATENAME(MONTH,order_date) as MONTHS,
count(distinct order_id) as Total_orders
	from pizza_sales
	group by DATENAME(MONTH,order_date)

--% of Sales by Pizza Category
SELECT pizza_category,
SUM(total_price) as Total_revenue,
cast(SUM(total_price) * 100 / (select SUM(total_price) from pizza_sales) as decimal(10,2)) as PCT
	from pizza_sales
	group by pizza_category
--% of Sales by Pizza Size
SELECT pizza_size,
SUM(total_price) as Total_revenue,
cast(SUM(total_price) * 100 / (select SUM(total_price) from pizza_sales) as decimal(10,2)) as PCT
	from pizza_sales
	group by pizza_size
--Total Pizzas Sold by Pizza Category
select pizza_category,
sum(quantity) as Total_quantity
	from pizza_sales
	group by pizza_category
--Top 5 Pizzas by Revenue
select top 5 pizza_name,
sum(total_price) as Total_Revenue
	from pizza_sales
	group by pizza_name
	order by Total_Revenue desc
--Botton 5 Pizzas by Revenue
select top 5 pizza_name,
sum(total_price) as Total_Revenue
	from pizza_sales
	group by pizza_name
	order by Total_Revenue asc
--Top 5 Pizzas by Quantity
select top 5 pizza_name,
sum(quantity) as Total_quantity
	from pizza_sales
	group by pizza_name
	order by Total_quantity desc
--Botton 5 Pizzas by Quantity
select top 5 pizza_name,
sum(quantity) as Total_quantity
	from pizza_sales
	group by pizza_name
	order by Total_quantity ASC
--Top 5 Pizzas by orders
select top 5 pizza_name,
count(distinct order_id) as Total_orders
	from pizza_sales
	group by pizza_name
	order by Total_orders desc
--Botton 5 Pizzas by orders
select top 5 pizza_name,
count(distinct order_id) as Total_orders
	from pizza_sales
	group by pizza_name
	order by Total_orders ASC
	
	
	