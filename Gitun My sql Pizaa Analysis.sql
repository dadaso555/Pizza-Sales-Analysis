
select * from orders ;
select * from  pizza ;
select * from   pizza_type;  
select * from  order_details;

# Q1:The total number_of_order place..?
SELECT COUNT(order_id) AS total_orders
FROM orders; 

# Q2: The total revenue generated from pizza sales
SELECT distinct  count(quantity) AS total_revenue
FROM order_details; 

#Q3: The highest priced pizza.
select distinct  price from pizza order by price desc LIMIT 1 ;

#Q4: The most common pizza size ordered.
SELECT size, COUNT(*) as OrderCount
FROM pizza
GROUP BY size
ORDER BY OrderCount DESC
LIMIT 1;

-- #Q5: The top 5 most ordered pizza types along their quantities.
    select quantity,order_id, count(*) as ordered_pizza from order_details group by 
    quantity,order_id order by quantity DESC LIMIT 5;


# Q6: The quantity of each pizza categories ordered.
select * from   pizza_type; 
select category, count(*) as quantity from pizza_type group by category;

# -- Q7: The distribution of orders by hours of the day.
select * from orders ;
select extract(hour from time) as hour , MIN(time )as time from orders group by extract(hour from time) order by hour ;


#Q8: The category-wise distribution of pizzas.
select * from   pizza_type;
select * from  pizza ;
SELECT  pt.category AS category_wise_distribution FROM pizza p
 JOIN pizza_type pt ON p.pizza_type_id = pt.pizza_type_id GROUP BY  pt.category ORDER BY category_wise_distribution DESC;

 # -- Q9: The average number of pizzas ordered per day.	
select * from order_details ;
select * from orders ;
select orders.date,AVG( order_details.quantity) as average_number_Pizza  from order_details 
join orders on order_details.order_id = orders.order_id 
group by orders.date order by average_number_pizza DESC;

#-- Q10: Top 3 most ordered pizza type base on revenue.
select * from   pizza_type;  
select * from  pizza ;
select pizza_type.category, max(pizza.price) as revenue from pizza inner join pizza_type on pizza.pizza_type_id = pizza_type.pizza_type_id
group by  pizza_type.category order by revenue LIMIT 3;

    

  



