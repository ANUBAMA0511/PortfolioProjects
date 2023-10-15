select * from pizza_sales

--Total revenue
Select sum(total_price) As Total_revenue from pizza_sales

--Average order Value
select sum(total_price)/ count (distinct order_id) As Average_order_value from pizza_sales

--Total Pizzas Sold
Select sum (quantity) AS Total_pizza_sold from pizza_sales

--Total orders
select count(DISTINCT order_id) AS Total_order from pizza_sales

--Average pizzas per order
select cast(cast(sum(quantity) AS decimal (10,2)) / cast(COUNT (Distinct order_id) as decimal (10,2)) AS decimal (10,2)) AS Average_pizzas_per_order from pizza_sales

--Chart Requirements:
select Datename (DW, order_date) as order_day, count(distinct order_id) As Total_orders from pizza_sales
Group by Datename (DW, order_date)

--Monthly trend for totalorders
select datename(month,order_date) as Month_name, COUNT(DISTINCT Order_id) as Total_orders
from pizza_sales
group by datename(month, order_date)

--Percentage of sales by pizza category
select * from  pizza_sales
select pizza_category, sum(total_price) as Total_sales, sum(total_price)*100 / (select sum(total_price)from pizza_sales) As Percentage_Total_sales
from pizza_sales 
Group by pizza_category

--Percentage of sales by pizza size
select pizza_size, sum(total_price) as Total_sales, cast(sum(total_price)*100 / (select sum(total_price)from pizza_sales) as decimal(10,2)) As Percentage_Total_sales
from pizza_sales 
Group by pizza_size

--Top 5 best sellers by revenue
select top 5 pizza_name, sum(total_price) as total_revenue from pizza_sales
Group by pizza_name
order by total_revenue desc

--Bottom 5 best sellers by revenue
select top 5 pizza_name, sum(total_price) as total_revenue from pizza_sales
Group by pizza_name
order by total_revenue asc

-- Top 5 best sellers by quantity
select top 5 pizza_name, sum(quantity) as total_quantity from pizza_sales
Group by pizza_name
order by total_quantity desc

-- Bottom 5 best sellers by quantity
select top 5 pizza_name, sum(quantity) as total_quantity from pizza_sales
Group by pizza_name
order by total_quantity asc

--Top 5 best sellers by orders
select top 5 pizza_name, count(Distinct order_id) as total_orders from pizza_sales
Group by pizza_name
order by total_orders desc

-- Bottom 5 best sellers by orders
select top 5 pizza_name, count(Distinct order_id) as total_orders from pizza_sales
Group by pizza_name
order by total_orders asc

select * from pizza_sales