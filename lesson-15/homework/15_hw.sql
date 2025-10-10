-- 1-task
-- Find Employees with Minimum Salary
select id, name, salary
from employees
where salary in (select MIN(salary) from employees);

-- 2-task
-- Find Products Above Average Price
select id, product_name, price
from products
where price > (select AVG(price) from products);

-- 3-task
-- Find Employees in Sales Department
select *
from employees
where department_id in (select id from departments where department_name = 'Sales');

-- 4-task
-- Find Customers with No Orders
select * 
from customers
where customer_id not in (select customer_id from orders);

-- 5-task
-- Find Products with Max Price in Each Category
select p.*
from products as p
where p.price = (select MAX(price) from products where category_id = p.category_id)